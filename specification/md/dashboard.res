# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: dashboard
#

###############################################################################
# Group: Description
#
#   __Resource to edit GoodData dashboards.__
#
#   Dashboards give the end users interactive insight into their data.
#
#   The resource allows you to place a metadata object (report, variable, etc.)
#   on the selected dashboard. It is possible to place there only objects 
#   created by current user or objects which are shared with everyone.
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/dashboard
#  
#       GET - * -> <About>
#
#   header: /gdc/md/<project>/dashboard/items
#  
#		GET   * -> DashboardItems      % returns all dashboarded items for context user
#		POST DashboardItem 			   % add a new item on dashboard
#				-> 201 Created (Location: URISTRING)
#  
#
#   header: /gdc/md/<project>/dashboard/items/<id>
#  
#		GET * -> DashboardItem         % get a item
#  		PUT DashboardItem -> OK        % update dashboard item
#  		DELETE * -> 204 No Content     % remove item from dashboard

###############################################################################
# Group: Data Structures
#
#   header: DashboardItem
#
#   (start code)
#	 DashboardItem = < dashboardItem : {
#    	content: {                                  
#       	obj : URISTRING 		   % uri of dashboarded object 
#       },
#       
#		%ifdef OUT_ONLY
#       links: {
#           self: URISTRING
#       }
#       %endif
#	 }>
#   (end)
#
#   header: DashboardItems
#
#   (start code)
#	 DashboardItems = < dashboardItems : [ DashboardItem ] >
#   (end)

###############################################################################
# Group: Mock-up
#
#   (start example)
#     POST /gdc/md/<project>/dashboard/items
#     BODY: {"dashboardItem":{"content":{"obj":"/gdc/md/<project>/obj/123"}}}
#     Response
#     HEAD: 201
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
