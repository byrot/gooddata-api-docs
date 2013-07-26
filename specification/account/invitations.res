# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: invitations
#

###############################################################################
# Group: Description
#
#   Not auth resource for getting and refusing invitations.
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/account/invitations/$uniquestring
#           Invitations users to project
#  
#           GET -  
#           - (200 Ok) <NoAuthInvitation>
#           - (404 Not found) % invitation not found
#                 
#           POST - <InvitationStatusAccept>
#           - (200 No Content)  % Invitation updated
#           - (400 Bad Request) % bad structure, invitation is not in WAITING state
#           - (403 Forbidden)   % user already has an account, use auth. resource
#           - (404 Not found)   % invitation not found
#
###############################################################################
# Group: Data Structures
#
#   header: NoAuthInvitation
#
#   (start code)
#	NoAuthInvitation = < invitation : {   
#      meta: { 
#       title : STRING[1,255],   % title can't contain only whitespace characters
#       (category : STRING)?,
#       (summary : STRING)?,
#       (tags : TAGS)?,
#       (author : {				 % this field is ignored in POST and PUT and is set by server automatically
#    	  self : URISTRING,
#     	  firstName : STRING,
#    	  lastName : STRING,
#    	  email : EMAIL
#   	} )?,      
#       (created : DATETIME)?,   % this field is ignored in POST and PUT and is set by server automatically
#       (contributor : {		 % this field is ignored in POST and PUT and is set by server automatically
#    	  self : URISTRING,
#     	  firstName : STRING,
#    	  lastName : STRING,
#    	  email : EMAIL
#   	} )?,      
#       (updated : DATETIME)?,      % this field is ignored in POST and PUT and is set by server automatically
#       (deprecated: BOOLEAN)?,     % Default is false.
#       (projectTemplate: URISTRING)?,
#       (help: URISTRING)?
#      },
#      content: {
#      	(status: 'ACCEPTED' | 'REFUSED' | 'WAITING' | 'CANCELED')?,
#      	(email: EMAIL)?,
#      	(firstname: STRING)?,
#      	(lastname: STRING)?,
#      	(phonenumber: STRING)?,
#      	(projectname: STRING)?,
#      	(role: URISTRING)?,         % initial user role in project
#       (userFilters: [STRING])?,
#       (action: {
#         (setMessage: STRING)?,    % user message
#         (inviteTo: URISTRING)?    % invite to an object
#       })?,
#      },
#     (links: {
#      	self: URISTRING,	   % /gdc/projects/$project/invitations/$invitation
#      	project: URISTRING,    % /gdc/projects/$project
#      	(profile: URISTRING)?  % /gdc/account/profile/$user_id - present only if user is already registred      	
#      })?      
#	}>
#
#   (end)
#
#   header: InvitationStatus
#
#   (start code)
#	InvitationStatusAccept = < invitationStatusAccept : {   
#      	status: 'ACCEPTED' ,
#	}>
#   (end)
#

###############################################################################
# Group: Data Structures
#
###############################################################################
# Group: Mock-up
#
#	
#   header: Get invitation by uniquestring
#   (start example)
#	GET http://localhost/gdc/account/invitations/GkBcecZRenOL5OT_R2T_KAnL8ekg_Msw
#	Request
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
#	      firstName: John
#	      lastName: Doe
#	      email: john.doe@foodz.com
#	      self: /gdc/account/profile/1
#	    contributor: 
#	      firstName: John
#	      lastName: Doe
#	      email: john.doe@foodz.com
#	      self: /gdc/account/profile/1
#	    created: 2008-09-09 12:49:02
#	    modified: 0000-00-00 00:00:00
#	    summary: ~
#	    title: ~
#   (end)
#	
#   header: Refuse invitation
#   (start example)
#	POST http://localhost/gdc/account/invitations/GkBcecZRenOL5OT_R2T_KAnL8ekg_Msw
#	Request
#	BODY: {"invitation":{"content":{"status":"REFUSED"}}}
#	Response
#	HEAD: 200 OK
#	BODY: ""
#   (end)
#


################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
