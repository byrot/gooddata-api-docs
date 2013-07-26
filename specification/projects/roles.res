# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: roles
#
###############################################################################
# Group: Description
#
#   __Project security roles management.__
#
#   It is possible to define security roles in the project. You may add various
#   rights to the role, and then assign a role to users.
#
#   __Related resources:__
#
#   - /gdc/projects
#   - /gdc/projects/<project>/users
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/projects/<project>/roles
#
#           GET -
#              - (200 Ok) <ProjectRoles> | <About>
#              - (404 Not found)
#
#           POST - <ProjectRole>
#              - (200 Ok) ANY
#              - (404 Not found)
#
#   header: /gdc/projects/<project>/roles/<role>/users
#
#        GET -
#           - (200 OK) <AssociatedUsers>
#
#        POST - <AssociateUser>
#            - 20O OK

###############################################################################
# Group: Security Consideration
#
#   header: /gdc/projects/<project>/roles
#     POST - canCreateRole
#
#   header: /gdc/projects/<project>/roles/<role>/users
#     POST - canAssignUserWithRole

###############################################################################
# Group: Data Structures
#
#   header: PERMISSIONS
#
#   PERMISSIONS = 'canAccessWorkbench'|'canAssignUserWithRole'|'canCreateAttribute'|'canCreateAttributeGroup'|'canCreateAttributeLabel'|'canCreateColumn'|'canCreateComment'|'canCreateDataSet'|'canCreateDomain'|'canCreateETLFile'|'canCreateFact'|'canCreateFolder'|'canCreateHelp'|'canCreateMetric'|'canCreateProjectDashboard'|'canCreateProjectTemplates'|'canCreatePrompt'|'canCreateReport'|'canCreateReportDefinition'|'canCreateRole'|'canCreateScheduledMail'|'canCreateTable'|'canCreateTableDataLoad'|'canInitData'|'canInviteUserToProject'|'canListInvitationsInProject'|'canListUsersInProject'|'canManageAttribute'|'canManageAttributeGroup'|'canManageAttributeLabel'|'canManageColumn'|'canManageComment'|'canManageDataSet'|'canManageDataSet'|'canManageDomain'|'canManageETLFile'|'canManageFact'|'canManageFolder'|'canManageHelp'|'canManageMetric'|'canManageProject'|'canManageProjectDashboard'|'canManagePrompt'|'canManageReport'|'canManageReportDefinition'|'canManageScheduledMail'|'canManageTable'|'canManageTableDataLoad'|'canRefreshData'|'canSeeOtherUserDetails'|'canSetProjectVariables'|'canSetUserVariables'|'canSuspendUserFromProject'|'canValidateProject'|'canSubscribeNotification'
#
#   header: ProjectRole
#
#   (start code)
#   ProjectRole = < projectRole : {
#     meta : Meta,
#     permissions : {
#       (PERMISSIONS : BOOLEAN)*
#     },
#     (links : { % maybe more appropriate key-word is "navigation"
#       roleUsers : URISTRING
#     })?
#   } >
#   (end)
#
#   header: ProjectRoles
#
#   (start code)
#   ProjectRoles = < projectRoles : {
#     links : {
#       project : URISTRING
#     },
#     roles: [ URISTRING ]
#   } >
#   (end)
#
#   header: AassociatedUsers
#
#   (start code)
#   AassociatedUsers = < associatedUsers : {
#     links : {
#       project : URISTRING,
#       role : URISTRING
#     },
#     users : [ URISTRING ]
#   } >
#   (end)
#
#   header: associatedUser
#
#   (start code)
#   AssociateUser = < associateUser : {
#     user : URISTRING
#   } >
#   (end)
#

###############################################################################
# Group: Mock-up
#
#   header: Get roles list in probject
#   (start example)
#	GET https://secure.gooddata.com/gdc/projects/ProjectId/roles
#	Response
#	HEAD: 200 OK
#	BODY:
#	---
#	projectRoles:
#	  links:
#	    project: /gdc/projects/ProjectId
#	  roles:
#	    - /gdc/projects/ProjectId/roles/2
#	    - /gdc/projects/ProjectId/roles/7
#   (end)
#
#   header: Establish role for project
#   (start example)
#	POST https://secure.gooddata.com/gdc/projects/ProjectId/roles
#	BODY:
#	---
#	projectRole:
#	  meta:
#	    title: ETL File Manager
#	  permissions:
#	    canAccessWorkbench: 1
#	    canManageETLFile: 1
#	Response
#	HEAD: 200 OK
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Schmid
#
