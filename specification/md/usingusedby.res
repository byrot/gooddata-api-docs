# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: using and usedby
#
#	Resource returning dependency information about objects

###############################################################################
# Group: Description
#
#   Resource to explore usage and dependencies across metadata objects.
#
#   **THIS RESOURCE IS DEPRECATED!**
#   Use usedby2 and using2 instead.
#

###############################################################################
# Group: Resource(s)
###############################################################################

###############################################################################
# Resource: using  HAS BEEN DEPRECATED SINCE 2010-08-20, use using2 resource instead
#
# resource returning objects which specified object is using.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/using
#
#	parameters:
#		none
#
#	GET - *
#		-> 200 OK About
#
#	POST - SelConstrain
#	    -> 200 OK Using
#	    % to post one object only
#
#	POST - SelConstrains
#	    -> 200 OK UsingMult
#	    % to post serie of objects
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
# Resource: using_id  HAS BEEN DEPRECATED SINCE 2010-08-20, use using2 resource instead
#
# resource returning objects which specified object is using.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/using/<id>
#
#	GET - *
#		-> 200 OK Using
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
# Resource: usedby   HAS BEEN DEPRECATED SINCE 2010-08-20, use usedby2 resource instead
#
# resource returning objects which uses specified object (ie. object is used by
# these objects)
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/usedby
#
#	parameters:
#		none
#
#	GET - *
#		-> 200 OK About
#
#	POST - SelConstrain
#	    -> 200 OK Using
#	    % to post one object only
#
#	POST - SelConstrains
#	    -> 200 OK UsingMult
#	    % to post serie of objects
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
# Resource: usedby_id  HAS BEEN DEPRECATED SINCE 2010-08-20, use usedby2 resource instead
#
# resource returning objects which uses specified object (ie. object is used by
# these objects)

# Topic: Synopsis
#
#	header: /gdc/md/<project>/usedby/<id>
#
#	GET - *
#		-> 200 OK Using
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
# Structure: Using
#
#	envelope structure for resources for single object result
#
# Topic: Specification
#
#   (start code)
#   Using = < using : Use >
#   (end)

###############################################################################
# Structure: UsedBy
#
#	envelope structure for resources for single object result
#
# Topic: Specification
#
#   (start code)
#   UsedBy = < usedby : Use >
#   (end)

###############################################################################
# Structure: UsingMult
#
#	envelope structure for resources for serie of objects
#
# Topic: Specification
#
#   (start code)
#   UsingMult = < usingmult : [ Use ] >
#   (end)

###############################################################################
# Structure: UsedByMult
#
#	envelope structure for resources for serie of objects
#
# Topic: Specification
#
#   (start code)
#   UsedByMult = < usedbymult : [ Use ] >
#   (end)

###############################################################################
# Structure: Use
#
#	main dependency data structure
#
# Topic: Specification
#
#   (start code)
#   Use = {                 % from: and to: references to position (0..n) in the objects: array
#      nodes : Links,
#      edges : [ { from : INT | NULL, to : INT | NULL } ]
#   }
#   (end)
#
# Topic: Description
#
#	{There should be described meaning of structure especially for top level
#	structures. Meaning of keys can be briefly described in structure
#	definition as comment.}
#

###############################################################################
# Structure: SelConstrain
#
#	request structure for one object
#
# Topic: Specification
#
#   (start code)
#   SelConstrain = { uri : URI }
#   (end)

###############################################################################
# Structure: SelConstrains
#
#	request structure for serie of objects
#
# Topic: Specification
#
#   (start code)
#   SelConstrains = { uri : [ URI ] }
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
#	{Owner Name or names separated by comma, persons which are responsible for
#	completness and correctenes	of this docummentation.}
#
