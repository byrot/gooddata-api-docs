# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: projectId
#

###############################################################################
# Group: Description
#
#   Project management.
#
#

###############################################################################
# Group: Resource(s)
# 
#   header: /projects/<project>
#
#           GET -
#              - (200 Ok) <Project>
#              - (404 Not found)
#
#           POST - <Project> 
#              - (200 Ok)
#              - (404 Not found)
#
#           DELETE -
#              - (204 No Content)
#              - (404 Not found)
#  

###############################################################################
# Group: Security Consideration
#
#   header: /projects/<project>
#     POST - canManageProject
#     DELETE - project owner

###############################################################################
# Group: Data Structures
#
#   header: Project
#
#   (start code)
#   Project = < project : ProjectType>
#
#   ProjectType = {
#      meta: Meta,  % content project title, summary...
#	      content: {
#		     %ifdef OUT_ONLY
#	      	 	state : 'PREPARING'  | 'PREPARED' | 'LOADING' | 'ENABLED' | 'DISABLED' | 'DELETED' | 'ARCHIVED', 
#	         	isPublic : BOOLEAN,
#	         	cluster: STRING,
#		     %endif
#            guidedNavigation : BOOLEAN,
#            (authorizationToken : STRING | NULL)?,
#			%ifdef OUT_ONLY
#            		driver : 'mysql' | 'Pg' | 'vertica',	% when asking for a project's details, DWH engine is always returned
#			%endif
#			%ifdef IN_ONLY
#            		(driver : 'mysql' | 'Pg' | 'vertica')?,	% when creating a project, DWH engine may be specified, defaults: Pg
#			%endif
#	      },
#      (links: {
#        self: URISTRING,				% /gdc/projects/$project_name     
#        users: URISTRING,				% /gdc/projects/$project/users            
#        (userRoles : URISTRING)?,		% /gdc/projects/$project/users/$user/roles
#        (userGroups : URISTRING)?,		% /gdc/projects/$project/users/$user/groups
#        (userPermissions : URISTRING)?,% /gdc/projects/$project/users/$user/permissions
#        roles: URISTRING,				% /gdc/projects/$project/roles
#        groups: URISTRING,             % /gdc/projects/$project/groups
#        invitations: URISTRING,   		% /gdc/projects/$project/invitations     
#        ldm           : URISTRING, 	% /gdc/projects/$project/ldm - image with LDM
#        ldm_thumbnail : URISTRING, 	% /gdc/projects/$project/ldm?thumbnail=1 LDM thumbnail
#        metadata: URISTRING,			% /gdc/md/project_name
#        publicartifacts: URISTRING,	% /gdc/projects/$project/publicartifacts
#        uploads : URISTRING,	        % /project-uploads/$project/
#        templates: URISTRING,			% /gdc/md/project_name/templates
#        connectors: URISTRING,			% /gdc/projects/$project/connectors
#        dataload: URISTRING,			% /gdc/projects/$project/dataload
#        schedules: URISTRING,			% /gdc/projects/$project/schedules
#        eventstores: URISTRING,		% /gdc/projects/$project/eventStore/stores
#      })?
#   }
#   (end)
#

###############################################################################
# Group: Mock-up
#
#   header: Get project by Id
#   (start example)
#	GET http://localhost/gdc/projects/FoodMartDemo
#	Response
#	HEAD: 200 OK
#	BODY: 
#	--- 
#	project: 
#	  content: 
#	    state: ENABLED
#	  links: 
#	    invitations: /gdc/projects/FoodMartDemo/invitations
#	    self: /gdc/projects/FoodMartDemo
#	    users: /gdc/projects/FoodMartDemo/users
#	  meta: 
#	    author: 
#	      name: ~
#	      uri: /gdc/account/profile/9999
#	    contributor: 
#	      name: ~
#	      uri: /gdc/account/profile
#	    created: 2008-09-02 16:30:36
#	    summary: FoodMartDemo
#	    title: FoodMartDemo
#	    updated: 0000-00-00 00:00:00
#   (end)
#	
#   header: Update project
#   (start example)
#	POST http://localhost/gdc/projects/FoodMartDemo
#	BODY: {"project":{"content":{"guidedNavigation":1},"meta":{"title":"Project Renamed", "summary":"A new project description"}}          
#	Response
#	HEAD: 200 OK
#	BODY: 
#   (end)
#	
#   header: Remove project
#   (start example)
#	DELETE http://localhost/gdc/projects/FoodMartDemo
#	Response
#	HEAD: 200 OK
#   (end)
#	

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
