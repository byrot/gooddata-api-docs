# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: invitations
#

###############################################################################
# Group: Description
#
#   __Resource to manage user invitations.__
#
#   You may invite anyone into your project. It is sufficient to have his or
#   her email address. You just create an invitation, and post it on this
#   resource. You may also list all pending invitations, or cancel them.
#
#   For the invited user you may set:
#
#     - name, email, telephone
#     - project role
#     - initial user filter
#     - status of the invitation
#
#   __Related resources:__
#
#    - /gdc/projects/<project>/invitations/<invitation>
#    - /gdc/projects/<project>/users
#    - /gdc/account
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/projects/<project>/invitations
#           Invitations users to project
#
#           GET -
#           - (200 Ok) <Invitations>
#           - (404 Not found) % project not found
#
#           POST - <Invitations>
#           - (201 Created) CreatedInvitations % add new invitations
#           - (404 Not found)   % project not found
#

###############################################################################
# Group: Security Consideration
#
#   header: /gdc/projects/<project>/invitations
#     GET - canListInvitationsInProject
#     POST - canInviteUserToProject

###############################################################################
# Group: Data Structures
#
#   header: Invitation
#
#   (start code)
#     Invitation = < invitation : {
#       (meta: Meta)?,
#       content: {
#         (status: 'ACCEPTED' | 'REFUSED' | 'WAITING' | 'CANCELED')?,
#         (email: EMAIL)?,
#         (firstname: STRING)?,
#         (lastname: STRING)?,
#         (phonenumber: STRING)?,
#         (projectname: STRING)?,
#         (role: URISTRING)?,         % initial user role in project
#         (userFilters: [STRING])?,   % initial set of userFilter identifiers for invited user
#         (action: {
#           (setMessage: STRING)?,    % user message
#           (inviteTo: URISTRING)?    % invite to an object
#         })?,
#       },
#       (links: {
#         self: URISTRING,       % /gdc/projects/$project/invitations/$invitation
#         project: URISTRING,    % /gdc/projects/$project
#         (profile: URISTRING)?  % /gdc/account/profile/$user_id - present only if user is already registred
#       })?
#     }>
#
#   (end)
#
#   header: Invitations
#
#   (start code)
#     Invitations = < invitations : [Invitation] >
#   (end)
#
#   header: CreatedInvitations
#
#   (start code)
#     CreatedInvitations = < createdInvitations : {
#       uri: [URISTRING],
#       (uniq: [STRING])?  % present only in test environment
#     } >
#   (end)



###############################################################################
# Group: Mock-up
#
#
#   header: Get all pending invitations within a project
#   (start example)
#	GET https://secure.gooddata.com/gdc/projects/ProjectId/invitations
#	Response
#	HEAD: 200 OK
#	BODY:
#	---
#	invitations:
#	  -
#	    invitation:
#	      content:
#	        email: test@gooddata.com
#	        status: WAITING
#	      links:
#	        project: /gdc/projects/ProjectId
#	        self: /gdc/projects/ProjectId/invitations/1
#	      meta:
#	        author:
#	          name: John Doe
#	          uri: /gdc/account/profile/1
#	        contributor:
#	          name: ~
#	          uri: /gdc/account/profile
#	        created: 2008-09-08 14:36:16
#	        modified: 0000-00-00 00:00:00
#	        summary: ~
#	        title: ~
#	  -
#	    invitation:
#	      content:
#	        email: jiri.zaloudek@gooddata.com
#	        status: ACCEPTED
#	      links:
#	        project: /gdc/projects/ProjectId
#	        self: /gdc/projects/ProjectId/invitations/3
#	      meta:
#	        author:
#	          name: John Doe
#	          uri: /gdc/account/profile/1
#	        contributor:
#	          name: John Doe
#	          uri: /gdc/account/profile/1
#	        created: 2008-09-08 14:37:46
#	        modified: 2008-09-09 09:20:30
#	        summary: ~
#	        title: ~
#   (end)
#
#   header: Create a new invitation to a project
#   (start example)
#	POST https://secure.gooddata.com/gdc/projects/ProjectId/invitations
#	BODY:
#	---
#	invitations:
#	  -
#	    invitation:
#	      content:
#	        email: charlie@example.com
#	        firstname: Charlie
#	        lastname: Chaplin
#	Response
#	HEAD: 200 OK
#	BODY:
#	---
#	createdInvitations:
#	  uri:
#	    - /gdc/projects/ProjectId/invitations/1
#   (end)
#


################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
