# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: using2 and usedby2
#
#	Resource returning dependency information about objects

###############################################################################
# Topic: Description
#
# All resources in this documentation return persistent objects only.
#

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: using
#
# resource returning objects which specified object is using.
#
# Topic: Synopsis
#
#>	/md/<project>/using2
#
#	parameters:
#		none
#
#   (start example)
#	POST 
#	     InUse     -> OK Entries    % to post one object only
#		 InUseMany -> OK UseMany
#		 InUseMix  -> OK UseMany
#	(end)
#
# This resource can be used in two ways - either for getting one object dependencies or
# for getting dependencies for serie of objects.
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - draft
#
# Topic: Description
#
#	TODO
#	{There should be not so much brief description of resource. There should be
#	answered two main questions: Why? and How?. It means, Why someone should
#	use this resource? What is purpose of this resource? How it works? What is
#	intentional way to interact with this resource}
#
# Topic: Random Remarks
#
#  This resource can return huge data structure, and take a lot of backend resources.
#  Please use carefully.
#
# Topic: Performance mini-status
#
#	{stable-xx, avg/median time}
#
# Topic: Example
#
#	TODO
#	{There should be shown and commented example of calls, structures and using
#	this resource.}
#

###############################################################################
# Resource: using_id
#
# resource returning objects which specified object is using.
#
# Topic: Synopsis
#
#>	/md/<project>/using/<id>
#
#	parameters:
#		none
#
#
#   (start example)
#	GET *     -> OK Entries
#	GET types -> OK Entries % types = comma separated values
#	(end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - draft
#
# Topic: Description
#
#	TODO
#	{There should be not so much brief description of resource. There should be
#	answered two main questions: Why? and How?. It means, Why someone should
#	use this resource? What is purpose of this resource? How it works? What is
#	intentional way to interact with this resource}
#
# Topic: Random Remarks
#
#  This resource can return huge data structure, and take a lot of backend resources.
#  Please use carefully.
#
# Topic: Performance mini-status
#
#	TODO
#	{stable-xx, avg/median time}
#
# Topic: Example
#
#	TODO
#	{There should be shown and commented example of calls, structures and using
#	this resource.}
#

###############################################################################
# Resource: usedby
#
# resource returning objects which uses specified object (ie. object is used by
# these objects)
#
# Topic: Synopsis
#
#>	/md/<project>/usedby
#
#	parameters:
#		none
#
#   (start example)
#	POST 
#	     InUse     -> OK Entries    % to post one object only
#		 InUseMany -> OK UseMany
#		 InUseMix  -> OK UseMany
#	(end)
#
# This resource can be used in two ways - either for getting one object dependencies or
# for getting dependencies for serie of objects.
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - draft
#
# Topic: Description
#
#	TODO
#	{There should be not so much brief description of resource. There should be
#	answered two main questions: Why? and How?. It means, Why someone should
#	use this resource? What is purpose of this resource? How it works? What is
#	intentional way to interact with this resource}
#
# Topic: Random Remarks
#
#  This resource can return huge data structure, and take a lot of backend resources.
#  Please use carefully.
#
# Topic: Performance mini-status
#
#	{stable-xx, avg/median time}
#
# Topic: Example
#
#	TODO
#	{There should be shown and commented example of calls, structures and using
#	this resource.}
#

###############################################################################
# Resource: usedby_id
#
# resource returning objects which uses specified object (ie. object is used by
# these objects)

# Topic: Synopsis
#
#>	/md/<project>/usedby/<id>
#
#	parameters:
#		none
#
#   (start example)
#	GET *     -> OK Entries
#	GET types -> OK Entries % types = comma separated values
#	(end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - draft
#
# Topic: Description
#
#	TODO
#	{There should be not so much brief description of resource. There should be
#	answered two main questions: Why? and How?. It means, Why someone should
#	use this resource? What is purpose of this resource? How it works? What is
#	intentional way to interact with this resource}
#
# Topic: Random Remarks
#
#  This resource can return huge data structure, and take a lot of backend resources.
#  Please use carefully.
#
# Topic: Performance mini-status
#
#	{stable-xx, avg/median time}
#
# Topic: Example
#
#	TODO
#	{There should be shown and commented example of calls, structures and using
#	this resource.}
#
###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: InUse
#
#	envelope structure for resources for serie of objects
#
# Topic: Specification
#
#   (start code)
#   InUse = < inUse : Use2 >
#
#   Use2 = { uri : URISTRING,
#            ( types : [ STRING ] )?
#          }
#   (end)

###############################################################################
# Structure: InUseMany
#
#	envelope structure for resources for serie of objects
#
# Topic: Specification
#
#   (start code)
#   InUseMany = < inUseMany :  { uris  : [ URISTRING ],
#                              ( types : [ STRING ] )? } 
#               >
#   (end)

###############################################################################
# Structure: InUseMix
#
#	envelope structure for resources for serie of objects
#
# Topic: Specification
#
#   (start code)
#   InUseMix = < inUseMix : [ Use2 ] >
#   (end)

###############################################################################
# Structure: UseMany
#
#	main dependency data structure
#
# Topic: Specification
#
#   (start code)
#   UseMany = < useMany : [ { uri : URISTRING,
#                         entries : Links }
#             ]>
#   (end)
#
# Topic: Description
#
#	{There should be described meaning of structure especially for top level
#	structures. Meaning of keys can be briefly described in structure
#	definition as comment.}
#

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
#	{Owner Name or names separated by comma, persons which are responsible for
#	completness and correctenes	of this docummentation.}
#
