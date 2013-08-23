use strict;
use warnings;
use feature 'switch';

die 'Invalid file name given. Use with parameter "file.res"'
	unless $ARGV[0] =~ m/^[\.\/\w\-_]+\.res$/;

my $r = new Resource( $ARGV[0] );
$r->read();
$r->blueprint();


###############################################################################
package Resource;
use JSON;

sub new {
	my ( $class, $filename ) = @_;

	$filename or die 'Filename not given';

	return bless {
		filename    => $filename,
		group       => 'null',
		description => '',
		section     => '',
		resources   => {},
		examples    => [],
	}, $class;
}

sub read {
	my ( $self ) = @_;

	my $res;
	my $method;
	my %methodStatus;
	my %example = ( status => 'null' );

	open FILE, '<', $self->{filename} or die $!;

	eval {
		while ( <FILE> ) {
			my $l = $_;

			next unless $l =~ m/^#/;

			$self->set_group( $1 ) and next
				if $l =~ m/^#\s*Group:\s*([^\s]+)\s*$/;


			given ( $self->{group} ) {

				when ( 'description' ) {
					$self->set_group( 'null' ) and next
						if is_separator( $l );

					$self->{description} .= trim( clean_code( $l ) ) . "\n";
				}

				when ( 'null' ) {
					next if is_separator( $l );

					$self->{section} = $1
						if $l =~ m/^#\s*Section:\s*([^\s]+)\s*$/;
				}

				when ( 'resources' ) {
					my $header = $l =~ m/^#\s*header:\s*([^\s]+)\s*$/;

					if ( ( $header or is_separator( $l ) ) and defined $res and %methodStatus ) {
						$self->{resources}->{$res} = { %methodStatus };
						$res = undef;
						$method = '';
						%methodStatus = ();
					}

					$res = $1 and next if $header;

					$method = $1
						if $l =~ m/^#\s*(POST|GET|PUT|DELETE).*$/;

					$methodStatus{ $method }{ $1 } = undef
						if $l =~ m/^#\s*->?\s*\(?\s*([1-5][0-9]{2}).*$/;
				}

				when ( 'mockup' ) {

					# Decide context
					if ( $l =~ m/^#\s*header:\s*(.+)$/ ) {
						$example{name} = trim( $1 );
						next;
					} elsif ( $l =~ m/^#\s*\(start example\)\s*$/ or $l =~ m/^#\s*Request\s*$/ ) {
						$example{status} = 'request';
						next;
					} elsif ( $l =~ m/^#\s*Response\s*$/ ) {
						$example{status} = 'response';
						next;
					} elsif ( $l =~ m/^#\s*\(end\)\s*$/ ) {
						$example{status} = 'off';
					}

					# Reconstruct response, request, or push it to result
					if ( $example{status} eq 'request' ) {
						if( $l =~ m/^#\s*(POST|GET|PUT|DELETE)\s*([^\s]+)\s*$/ ) {
							$example{request}{method} = $1;
							$example{request}{uri} = $2;
							$example{request}{uri} =~ s|^https?://[a-z0-9\-\.]+/|/|i;
							next;
						} elsif( $l =~ m/#\s*BODY:(.*)$/ ) {
							$example{request}{body} .= clean_code( $1 );
							next;
						} else {
							$example{request}{body} .= clean_code( $l );
						}
					} elsif ( $example{status} eq 'response' ) {
						if( $l =~ m/^#\s*HEAD:\s*(\d+).*$/ ) {
							$example{response}{code} = $1;
							next;
						} elsif( $l =~ m/#\s*BODY:(.*)$/ ) {
							$example{response}{body} .= clean_code( $1 );
							next;
						} else {
							$example{response}{body} .= clean_code( $l );
						}
					} elsif ( $example{status} eq 'off' ) {
						delete $example{status};
						push @{ $self->{examples} }, { %example };
						%example = ( status => 'null' );
					}
				}
			}
		}
	};
	die $@ if $@;

	close FILE;

	return 1;
}

sub blueprint {
	my ( $self ) = @_;

	print "--\n";
	#print join( ", ", sort keys %{ $r->{resources} } );
	print [ sort keys %{ $r->{resources} } ]->[0];
	print "\n\n";
	$r->{description} =~ s/<(.*)>/&lt;$1&gt;/g;
	print $r->{description};
	print "\n--\n\n";
	#print "\n\n__Examples__\n\n";

	my %exc; # To prevent repeating simple examples

	# Examples with code
	for my $e ( @{ $r->{examples} } ) {
		# Skip examples with missing info
		next unless $e->{request}->{method}
		        and $e->{request}->{uri}
			and $e->{response}->{code};

		#print $e->{name} . "\n";
		# Request
		print $e->{request}->{method} . ' ';
		print $e->{request}->{uri} . "\n";
		print_body( $e->{request}->{body}, '>' )
			if ( $e->{request}->{body} );
		# Response
		print '< ' . $e->{response}->{code} . "\n";
		print_body( $e->{response}->{body}, '<' )
			if ( $e->{response}->{body} );
		print "\n\n";
		$exc{ $e->{request}->{method} . $e->{request}->{uri} } = undef;
	}

	# Simple examples
	for my $k ( sort keys %{ $r->{resources} } ) {
		for my $m ( sort keys %{ $r->{resources}->{$k} } ) {
			# Print all possible return status codes - not supported in blueprint v. 1
			# print "$m $k\n< " . join( "\n< ", sort keys %{ $r->{resources}->{$k}->{$m} } ) . "\n\n\n"
			print "$m $k\n< " . [ sort keys %{ $r->{resources}->{$k}->{$m} } ]->[0] . "\n\n\n"
				unless exists $exc{ $m . $k };
			$exc{ $m . $k } = undef;
		}
	}

	print "\n\n";
}

sub print_body {
	my ( $body, $dir ) = @_;

	# Guess content type
	if ( $body =~ m/^\s*---\s*\n/ ) {
		print "$dir Content-type: application/yaml\n";
	} elsif ( $body =~ m/^\s*[\[\{].*/ ) {
		print "$dir Content-type: application/json\n";
		my $json = new JSON;
		$body = $json->pretty->encode( $json->decode( $body ) );
	}

	# Drop starting tabs if they are on each line
	if ( $body =~ m/^(\t.*\n)*$/ ) {
		my @a = split( "\n", $body );
		for ( @a ) {
			$_ =~ s/\t(.*)/$1/;
		}
		$body = join( "\n", @a );
		$body .= "\n";
	}
	print $body;

	return 1;
}

sub clean_code {
	my ( $l ) = @_;

	$l =~ s/^#(.*)$/$1/;

	return $l;
}

sub trim {
	my ( $str ) = @_;

	$str =~ s/^\s+//;
	$str =~ s/\s+$//;

	return $str;
}

sub is_separator {
	my ( $l ) = @_;

	return 1 if $l =~ m/^#{8,256}$/;
	return 0;
}

sub set_group {
	my ( $self, $group ) = @_;

	$group =~ s/[^\w]//g;
	$self->{group} = lc( $group );

	return 1;
}

1;
