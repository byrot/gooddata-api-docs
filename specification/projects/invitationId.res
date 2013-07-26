# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: invitationId
#

###############################################################################
# Group: Description
#
#   __Resource to manage pending user invitations in the project.__
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /projects/<project>/invitations/<invitation>
#           GET - * -> (200 Ok) Invitation
#
#           POST - <Invitation>
#           - (200 Ok)
#           - (404 Not found) % Project or invitation not found
#
#           DELETE - * -> (204 No Content)
#           - (404 Not found) % Project or invitation not found
#

###############################################################################
# Group: Security Consideration
#
#   header: /projects/<project>/invitations/<invitation>
#     POST - invitation ownership
#     DELETE - canInviteUserToProject
#

###############################################################################
# Group: Mock-up
#
#   header: Get invitation by id
#   (start example)
#	GET https://secure.gooddata.com/gdc/projects/ProjectId/invitations/15
#	Response
#	HEAD: 200 OK
#	BODY:
#	---
#	invitation:
#	  content:
#	    email: charlie@example.com
#	    firstname: Charlie
#	    lastname: Chaplin
#	    phonenumber: ~
#	    status: WAITING
#	  links:
#	    project: /gdc/projects/ProjectId
#	    self: /gdc/projects/ProjectId/invitations/20
#	  meta:
#	    author:
#	      name: John Doe
#	      uri: /gdc/account/profile/1
#	    contributor:
#	      name: ~
#	      uri: /gdc/account/profile
#	    created: 2008-09-09 12:49:02
#	    modified: 0000-00-00 00:00:00
#	    summary: ~
#	    title: ~
#   (end)
#	
#   header: Delete invitation (set as CANCELED)
#   (start example)
#	DELETE https://secure.gooddata.com/gdc/projects/ProjectId/invitations/3
#	Response
#	HEAD: 204 No Content
#   (end)
#	
#   header: Update invitation
#   (start example)
#	POST https://secure.gooddata.com/gdc/projects/ProjectId/invitations/3
#	BODY:
#	---
#	invitation:
#	  content:
#	    status: CANCELED
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
