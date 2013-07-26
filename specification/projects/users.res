# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: users
#
###############################################################################
# Group: Description
#
#   Project users management.
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /projects/<project>/users
#
#           GET
#              - (200 Ok) <Users>
#              - (404 Not found)
#
#           POST - <User> % update user status
#              - (200 Ok) <ProjectUsersUpdateResult>
#              - (404 Not found)
#
#           POST - <Users> % update status of many users
#              - (200 Ok) <ProjectUsersUpdateResult>
#              - (404 Not found)
#

###############################################################################
# Group: Security Consideration
#
#   header: /projects/<project>/users?[offset=offset&limit=limit]
#     GET - canListUsersInProject
#     POST - canSuspendUserFromProject, canAssignUserWithRole (for new users), only user who is domain owner may add new users (there users have to belong to the same domain

###############################################################################
# Group: Data Structures
#
#   header: User
#
#   (start code)
#   User = < user : {
#      (meta: Meta)?,                 % content title, summary...
#      content: {
#    	status: 'ENABLED' | 'DISABLED',
#    	(firstname: STRING[1+])?,
#    	(lastname: STRING[1+])?,
#    	(email: EMAIL)?,
#	(login: STRING)?,
#    	(phonenumber: STRING)?,
#       (userRoles : [ URISTRING ])?,    % useRoles that will be assigned to updated or new user (previous roles are discarded - there is no merge!)
#       (userGroups : [ URISTRING ])?
#      },
#      (links: {
#        self: URISTRING,			    % /account/profile/$userId
#        %ifdef OUT_ONLY
#            roles : URISTRING,             % /project/$project/users/$userId/roles
#            groups : URISTRING,            % /project/$project/users/$userId/groups
#            permissions : URISTRING,       % /project/$project/users/$userId/permissions
#            (groupUser: URISTRING)?,       % /project/$project/groups/$groupId/users/$userId  if the user is listed from group, this link points to a relationship  resource
#            projectRelUri : URISTRING, % /project/$project/users/$userId
#        %endif
#        (invitations: URISTRING)?,   	% /account/profile/$userId/invitations
#        (projects: URISTRING)?			% /account/profile/$userId/projects
#      })?
#   }>
#   (end)
#
#   header: ProjectUsersUpdateResult
#
#   (start code)
#   ProjectUsersUpdateResult = < projectUsersUpdateResult : {
#       successful : [ URISTRING ],
#       failed     : [ ProjectUsersUpdateFailedStructure ]
#   }>
#
#   ProjectUsersUpdateFailedStructure  = {
#        user      : URISTRING,
#        message   : STRING
#   }
#   (end)
#
#
#   header: Users
#
#   (start code)
#   Users = < users : [User]>
#   (end)
#
#   header: AssociatedRoles
#
#   (start code)
#   AssociatedRoles = < associatedRoles : {
#     links : {
#       project : URISTRING,
#       user : URISTRING
#     },
#     roles : [ URISTRING ]
#   } >
#   (end)
#
#   header: AssociatedPermissions
#
#   (start code)
#   AssociatedPermissions = < associatedPermissions : {
#     links : {
#       project : URISTRING,
#       user : URISTRING
#     },
#     permissions : {
#       (PERMISSIONS : BOOLEAN)*
#     }
#   } >
#   (end)

###############################################################################
# Group: Resource(s)
#
#   header: /projects/<project>/users/<user>
#
#           GET
#              - (200 Ok) <User>
#              - (404 Not found)
#
#           DELETE
#              - (200 Ok)
#              - (404 Not found)

###############################################################################
# Group: Security Consideration
#
#   header: /projects/<project>/users/<user>
#     GET - canListUsersInProject
#     DELETE - canSuspendUserFromProject

###############################################################################
# Group: Resource(s)
#
#   header: /projects/<project>/users/<user>/permissions
#
#           GET
#              - (200 Ok) <AssociatedPermissions>
#              - (404 Not found)

###############################################################################
# Group: Resource(s)
#
#   header: /projects/<project>/users/<user>/roles
#
#           GET
#              - (200 Ok) <AssociatedRoles>

###############################################################################
# Group: Mock-up
#
#   header: Get users in probject
#   (start example)
#	GET http://localhost/gdc/projects/FoodMartDemo/users
#	Response
#	HEAD: 200 OK
#	BODY:
#	---
#	users:
#	  -
#	    user:
#	      content:
#	        email: john@foodz.com
#	        firstname: John
#	        lastname: Doe
#	        phonenumber: 0
#	        status: ENABLED
#	        userRoles : [ /gdc/projects/FoodMartDemo/roles/1 ]
#	      links:
#	        invitations: /gdc/account/profile/1/invitations
#	        projects: /gdc/account/profile/1/users
#	        self: /gdc/account/profile/1
#	      meta:
#	        author:
#	          name: ~
#	          uri: /gdc/account/profile
#	        contributor:
#	          name: ~
#	          uri: /gdc/account/profile
#	        created: 2008-09-02 16:30:36
#	        title: John Doe
#	        updated: 0000-00-00 00:00:00
#	  -
#	    user:
#	      content:
#	        email: jane@foodz.com
#	        firstname: Jane
#	        lastname: Foodz
#	        phonenumber: 0
#	        status: ENABLED
#	      links:
#	        invitations: /gdc/account/profile/2/invitations
#	        projects: /gdc/account/profile/2/users
#	        self: /gdc/account/profile/2
#	      meta:
#	        author:
#	          name: ~
#	          uri: /gdc/account/profile
#	        contributor:
#	          name: ~
#	          uri: /gdc/account/profile
#	        created: 2008-09-02 16:30:36
#	        title: Jane Foodz
#	        updated: 0000-00-00 00:00:00
#   (end)
#
#   header: Update project by user structure
#   (start example)
#	POST http://localhost/gdc/projects/FoodMartDemo/users
#	Request
#	BODY: { "user" : { "content": { "status": "ENABLED"}, "links":{"self":"/gdc/account/profile/2" } } }
#	Response
#	HEAD: 200 OK
#   (end)
#
#   header: Update project by users structure
#   (start example)
#	POST http://localhost/gdc/projects/FoodMartDemo/users
#	Request
#	BODY: { "users" : [ { "user" : { "content": { "status": "ENABLED"}, "links":{"self":"/gdc/account/profile/1" } } }, { "user" : { "content": { "status": "ENABLED"}, "links":{"self":"/gdc/account/profile/2" } } } ] }
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
