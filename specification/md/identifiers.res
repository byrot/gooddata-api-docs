# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: object identifiers
#

###############################################################################
# Group: Description
#
#   __Resource retrieving metadata object identifiers.__
#
#   Object identifier is unique textual ID of metadata object. It can be
#   defined in MAQL for example.
#
#    __Related resources:__
#
#    - /gdc/md/<project>/obj
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/identifiers
#
#	GET - *
#		-> About
#
#	POST - UriToIdentifier
#		-> Identifiers
#		-> (400 Bad request) ErrorStruct
#
#	POST - IdentifierToUri
#		-> Identifiers
#		-> (400 Bad request) ErrorStruct
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
#

###############################################################################
# Group: Data Structures
#
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
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/identifiers
#	BODY: {"identifierToUri":["attr.opportunity","attr.account"]}
#	Response
#	HEAD: 200
#	BODY: {"identifiers":[{"identifier":"attr.opportunity","uri":"/gdc/md/<project>/obj/750"},{"identifier":"attr.account","uri":"/gdc/md/<project>/obj/421"}]}
#   (end)
#
#   (start example)
#	POST /gdc/md/<project>/identifiers
#	BODY: {"uriToIdentifier":["/gdc/md/<project>/obj/750"]}
#	Response
#	HEAD: 200
#	BODY: {"identifiers":[{"identifier":"attr.opportunity","uri":"/gdc/md/<project>/obj/750"}]}
#   (end)
#

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	jiri
#
