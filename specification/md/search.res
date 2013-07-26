# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: Search
#
#	Search project metadata.

###############################################################################
# Topic: Description
#
#	Resource capable to search title and descriptions of metadata for
#	specified texts.

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: search
#
#	Search project metadata.
#
# Topic: Synopsis
#
#>	/md/<project>/search
#
# Topic: Parameters
#>	/md/<project>/search[/STRING]
#
# (start example)
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
# (end)
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
