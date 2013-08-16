# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: Search
#
#	Search project metadata.

###############################################################################
# Group: Description
#
#   __Resource for metadata object searching.__
#
#   It is possible to search titles and descriptions of metadata objects.
#   The resource returns list of objects containing the search expression.
#   The search expression must be at least 3 characters long.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/obj
#   - /gdc/md/<project>/query
#

###############################################################################
# Group: Resource(s)
#
# Resource: search
#
#	Search project metadata.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/search
#
#	GET - *
#		-> 200 Ok
#
# Topic: Parameters
#
#	header: /gdc/md/<project>/search/<searchstring>
#
#   GET *
#     - (200 Ok) <About>
#
#   GET [/STRING]
#     - (200 Ok) <Entries>
#     - (400 Bad request) ErrorStruct
#
#   POST <Search>
#     - (200 Ok) <Entriesh>
#     - (400 Bad request) ErrorStruct
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - unrestricted
# visibility - public
# state - supported
#
# Topic: Description
#
#	Whenever it is needed to get object by specified text within title or description.
#
# Topic: Example
#
#	{There should be shown and commented example of calls, structures and using
#	this resource.}
#

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: Search
#
#	Structure for specifying search string.
#
# Topic: Specification
#
#   (start code)
#    Search = < search : STRING >
#   (end)
#
# Topic: Description
#
#	Key 'search' contains string at least 3 char long.

###############################################################################
# Section: Example
###############################################################################
#
#>	Search = < search : 'abcxyz' >

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	Jiri Schmid
