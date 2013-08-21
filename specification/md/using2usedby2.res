# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: using2 and usedby2
#

###############################################################################
# Group: Description
#
#   Resource to discover dependency information of metadata objects.
#   It returns references to persistent objects only.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/obj
#   - /gdc/md/<project>/using2
#   - /gdc/md/<project>/usedby2
#

###############################################################################
# Group: Resource(s)
#
#
# Resource: using
#
# resource returning objects which specified object is using.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/using2
#	POST - InUse
#		-> 200 Entries    % to post one object only
#	POST - InUseMany
#		-> 200 UseMany
#	POST - InUseMix
#		-> 200 UseMany
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
#
# Resource: using_id
#
# resource returning objects which specified object is using.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/using2/<id>
#
#	GET - *
#		-> 200 Entries
#	GET - types
#		-> 200 Entries % types = comma separated values
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
#
# Resource: usedby
#
# resource returning objects which uses specified object (ie. object is used by
# these objects)
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/usedby2
#
#	parameters:
#		none
#
#	POST - InUse
#		-> 200 Entries    % to post one object only
#	POST - InUseMany
#		-> 200 UseMany
#	POST - InUseMix
#		-> 200 UseMany
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
#
#
# Resource: usedby_id
#
# resource returning objects which uses specified object (ie. object is used by
# these objects)

# Topic: Synopsis
#
#	header: /gdc/md/<project>/usedby2/<id>
#
#	GET - *
#		-> 200 Entries
#	GET - types
#		-> 200 Entries % types = comma separated values
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
# Group: Mock-up
#
#
#   (start example)
#	POST /gdc/md/<project>/using2
#	BODY: {"inUse":{"uri":"/gdc/md/<project>/obj/1028","types":["tableDataLoad","table"]}}
#	Response
#	HEAD: 200
#	BODY: {"entries":[{"link":"/gdc/md/<project>/obj/1083","author":"/gdc/account/profile/5caf666e2ed30bc23e6ff3428af884a1","created":"2013-01-16 10:20:14","deprecated":"0","summary":"tableDataLoad dwh_dm_aac9ahyajuaoxqp from share dimension import process","updated":"2013-01-16 10:20:14","title":"share tableDataLoad dwh_dm_aac9ahyajuaoxqp","category":"tableDataLoad","contributor":"/gdc/account/profile/5caf666e2ed30bc23e6ff3428af884a1"},{"link":"/gdc/md/<project>/obj/1027","author":"/gdc/account/profile/5caf666e2ed30bc23e6ff3428af884a1","created":"2013-01-16 10:20:02","deprecated":"0","summary":"Table named lu_week_in_year for attribute Week (Sun-Sat).","updated":"2013-01-16 10:20:17","title":"lu_week_in_year (End Date)","category":"table","contributor":"/gdc/account/profile/5caf666e2ed30bc23e6ff3428af884a1"}]}
#   (end)
#
#   (start example)
#	POST /gdc/md/<project>/usedby2
#	BODY: {"inUse":{"uri":"/gdc/md/<project>/obj/1028","types":["tableDataLoad","table"]}}
#	Response
#	HEAD: 200
#	BODY: {"entries":[{"link":"/gdc/md/<project>/obj/1031","author":"/gdc/account/profile/7eaf666e2ed30bc23e6ff3428af884a1","created":"2013-01-16 10:20:02","deprecated":"0","summary":"DisplayForm Number US.","updated":"2013-01-16 10:20:02","title":"Number US (End Date)","category":"attributeDisplayForm","contributor":"/gdc/account/profile/7eaf666e2ed30bc23e6ff3428af884a1"},{"link":"/gdc/md/<project>/obj/1052","author":"/gdc/account/profile/5caf666e2ed30bc23e6ff3428af884a1","created":"2013-01-16 10:20:03","deprecated":"0","summary":"DataSet Date","updated":"2013-01-16 10:20:03","title":"Date (End Date)","category":"dataSet","contributor":"/gdc/account/profile/5caf666e2ed30bc23e6ff3428af884a1"},{"link":"/gdc/md/<project>/obj/1030","author":"/gdc/account/profile/5caf666e2ed30bc23e6ff3428af884a1","created":"2013-01-16 10:20:02","deprecated":"0","summary":"Generic Week based on US Weeks (Sun-Sat)","updated":"2013-01-16 10:20:04","title":"Week (Sun-Sat) (End Date)","category":"attribute","contributor":"/gdc/account/profile/5caf666e2ed30bc23e6ff3428af884a1"}]}
#   (end)
#

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	{Owner Name or names separated by comma, persons which are responsible for
#	completness and correctenes	of this docummentation.}
#
