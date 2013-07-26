# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: object identifiers
#

###############################################################################
# Topic: Description
#
#	Resource retrieving metadata object identifiers.

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource:
#
#	Instance-Identifiers
#
# Topic: Synopsis
#
#>	 gdc/md/< project >/identifiers
#
#   (start example)
#	GET *
#		-> About
#
#	POST UriToIdentifier
#		-> Identifiers
#		-> (400 Bad request) ErrorStruct
#
#	POST IdentifierToUri
#		-> Identifiers
#		-> (400 Bad request) ErrorStruct
#    (end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint42
#
# Topic: Description
#
#	Access this resource whenever you need obtain object human readable
#	identifier when known object uri and vice versa.
#
# Topic: Random Remarks
#
#	--
#
# Topic: Performance mini-status
#
#	--
#
# Topic: Example
#
#	GET, receive About.
#	POST  { identifierToUri : [ 'attr.1', 'attr.2' ] } },
#	receive pairs URI nad Identifier
#

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: Identifiers
#
#	List of object identifiers.
#
# Topic: Specification
#
#   (start code)
#   Identifiers = < identifiers : [ {
#     identifier : Identifier,
#     uri : URISTRING
#   } ] >
#   (end)

# Structure: IdentifierToUri
#
#	Strucuture with list of symbolic names to be expanded by related uri
#
# Topic: Specification
#
#   (start code)
#   IdentifierToUri = < identifierToUri : [ Identifier ] >
#   (end)

# Structure: UriToIdentifier
#
#	Strucuture with list of uris to be expanded by realted symbolic name
#
# Topic: Specification
#
#   (start code)
#   UriToIdentifier = < uriToIdentifier : [ URISTRING ] >
#   (end)

###############################################################################
# Section: Example
###############################################################################
#
#	{There should be shown and commented example workflow on resources
#	documented in this document}

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	jiri
#
