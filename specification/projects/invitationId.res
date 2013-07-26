# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: invitationId
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
#   header: /projects/<project>/invitations/<invitation>
#           GET - * -> (200 Ok) Invitation
#           
#           POST - <Invitation>
#           - (200 Ok)
#           - (404 Not found) % Project or invitation not found
#
#           DELETE - * -> (204 No Content)
#           - (404 Not found) % Project or invitation not found

###############################################################################
# Group: Security Consideration
#
#   header: /projects/<project>/invitations/<invitation>
#     POST - invitation ownership
#     DELETE - canInviteUserToProject

###############################################################################
# Group: Mock-up
#
#   header: Get invitation by id
#   (start example)
#	GET http://localhost/gdc/projects/FoodMartDemo/invitations/15
#	Response
#	HEAD: 200 OK
#	BODY: 
#	--- 
#	invitation: 
#	  content: 
#	    email: jiri.zaloudek@gooddata.com
#	    firstname: Jiri
#	    lastname: Zaloudek
#	    phonenumber: ~
#	    status: WAITING
#	  links: 
#	    project: /gdc/projects/FoodMartDemo
#	    self: /gdc/projects/FoodMartDemo/invitations/20
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
#	DELETE http://localhost/gdc/projects/FoodMartDemo/invitations/3
#	Response
#	HEAD: 204 No Content
#   (end)
#	
#   header: ACCEPT/REFUSE invitation
#   (start example)
#	POST http://localhost/gdc/projects/FoodMartDemo/invitations/3
#	BODY: {"invitation":{"content":{"status":"ACCEPTED"}}}
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
