# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: dashboard
#

###############################################################################
# Group: Description
#
#	 Allows to place a metadata object on dashboard.
# 
# 	 It is possible to place on dashboard only objects which has been created 
#    by current user or objects which are shared for everyone.
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/dashboard
#  
#       GET - * -> <About>
#
#   header: /md/<project>/dashboard/items
#  
#		GET   * -> DashboardItems      % returns all dashboarded items for context user
#		POST DashboardItem 			   % add a new item on dashboard
#				-> 201 Created (Location: URISTRING)
#  
#
#   header: /md/<project>/dashboard/items/<id>
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

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
