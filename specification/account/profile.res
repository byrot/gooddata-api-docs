# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: profile
#

###############################################################################
# Group: Description
#
# for manipulation with user's profile.
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /account/profile
#       creating a new profile by posting registration profile uri, not auth resource 
#
#
#       POST - <RegistrationProfile>
#       - (404 Not found)
#       - (201 Created) <Uri>
#
#       POST - <InvitationProfile>
#       - (404 Not found)   % invitation not exists or not in WAITING state
#       - (201 Created) <Uri>
#       - (400 Bad request) <WrongRegistration>
#
#   header: /account/domains/$domain/users
#       creating a new profile by posting AccountSetting, authenticated resource 
#
#       POST - <AccountSetting>
#       - (403 Forbidden)
#       - (400 Bad request)  
#       - (201 Created) <Uri>    % an uri of newly created user in format /account/profile/$user
#
#   header: /account/domains/$domain/users?offset=<offset>?limit=<limit>
#       listing of domain users
#       GET
#       - (200 OK) AccountSettings
#
#   header: /account/profile/$uid
#       get and modify accout information, auth resource 
#  
#     GET - * 
#         - (200 Ok) <AccountSetting>
#         - (404 Not found)
#
#     PUT - AccountSetting 
#         - (200 Ok) <AccountSetting>
#         - (403 Forbidden)
#         - (404 Not found)
#
#     DELETE - * 
#            - (204 No Content)
#            - (403 Forbidden)
#            - (404 Not found)
#
#   header: /account/profile/$uid/projects
#       Shows projects assigned to account
#  
#       GET   
#           - (200 Ok) <Projects>
#           - (404 Not found)  % user id not found
#
#   header: /account/profile/$uid/invitations
#       Projects invitations for user
#  
#       GET 
#           - (200 Ok) <Invitations>
#           - (404 Not found) % User or invitation not found
#
#   header: /account/profile/$user_id/settings
#       Profile settings
#
#       PUT - ProfileSetting
#           - (204 No Content)
#       GET
#           - (200 Ok) <ProfileSetting>


###############################################################################
# Group: Security Consideration
#
#   header: /account/profile/$uid
#     GET - canSeeOtherUserDetails
#     PUT - profile ownership
#     DELETE - profile ownership


###############################################################################
# Group: Data Structures
#
#   header: RegistrationProfile
#
#   (start code)
#    RegistrationProfile  = < registrationProfile : { uri: URISTRING }>
#   (end)
#
#   header: AccountSetting
#
#   (start code)
#   AccountSetting = < accountSetting : AccountSettingType>
#
#   AccountSettingType = {
#      (login : EMAIL | NULL)?,
#      (email : EMAIL | NULL)?,
#      (licence : STRING)?,
#      firstName : STRING[1+],
#      lastName : STRING[1+],
#      (companyName : STRING)?,
#      (position : STRING)?,
#      (created: DATETIME)?,
#      (updated: DATETIME)?,
#      (timezone : TIMEZONE | NULL )?,
#      (country : COUNTRY)?,
#      (phoneNumber: STRING)?,
#      (old_password : STRING)?,
#      (password : STRING[7+])?,
#      (verifyPassword : STRING[7+])?,
#      (ssoProvider: STRING)?,         % name of the SSO provider which is allowed to authenticate user
#      (links: {
#        projects : URISTRING,
#        (self : URISTRING)?,
#        %ifdef OUT_ONLY
#        (domain: URISTRING)?,         % domain where user belongs to %
#        %endif 
#      })?
#   }
#
#   Uri = <uri :URISTRING>
#   (end)
#
#   header: AccountSettings
#
#   (start code)
#    AccountSettings = <accountSettings: {
#     items:[AccountSetting],
#     paging: Paging
#    }>
#   (end)
#
#   header: Paging
#
#   (start code)
#
#   Paging = {
#     offset: INT,
#     count: INT,
#     (next : URISTRING)?
#   }
#   (end)
#
# SsoProvider = 'CAPGEMINI' | 'SALESFORCE' | 'PARDOT' | 'ZINCH' | 'TAKADU' | 'ADVANTIX'
#
#
# header: /account/domain/$domain/user
#       creating a new profile by posting AccountSetting, authenticated resource
#
#       POST - <AccountSetting>
#       - (403 Forbidden)
#       - (400 Bad request)
#       - (201 Created)     % an uri of newly created user in format /account/profile/$user
#
#   header: InvitationProfile
#
#   (start code)
#	InvitationProfile = < invitationProfile : {  
#	       profile : {
#		       login : EMAIL,
#		       licence : INT,
#		       firstName : STRING[1+],
#		       lastName : STRING[1+],
#		       (companyName : STRING)?,
#		       (position : STRING)?,
#		       (timezone : TIMEZONE | NULL )?,
#		       (country : COUNTRY)?,
#		       (phoneNumber: STRING)?,
#		       (role: STRING)?,
#		       (industry: STRING)?,
#		       password : STRING[7+],
#		       verifyPassword : STRING[7+]
#		   },  
#	       invitation : STRING[32,32]  % uniq string of invitation
#	}>
#   (end)
#   header: Projects
#
#   (start code)
#   Projects = < projects : [Project]>
#   (end)
#
#   (start code)
#	ProfileSetting = <profileSetting : ProfileSettingType>
#
#   ProfileSettingType = {
#		  currentProjectUri : URISTRING | NULL,
#		  releaseNotice : [STRING],
#		  hints: {(STRING: BOOLEAN)*},
#		  projectSettings: {(STRING: {
#           dashboard: URISTRING | NULL,
#           tab: STRING | NULL,
#           recentSearches: [STRING],
#           (introDisplayed: BOOLEAN)?
#         })*},
#         (separators : {
#           thousand: STRING,
#           decimal: STRING
#         })?,
#         %ifdef OUT_ONLY
#         %ALLOWED_ON_INPUT
#         links: {
#              self : URISTRING,
#              profile : URISTRING
#         }
#         %endif 
#   }
#   (end)
###############################################################################
# Group: Mock-up
#
#
#   header: get account setting.
#   (start example)
#	POST http://localhost/gdc/account/profile
#	BODY: { "invitationProfile" : { "profile" : { "login": "jiri.zaloudek@gooddata.com", "firstName": "jiri", "lastName": "zaloudek", "licence":1, "verifyPassword":"new_password","password":"new_password" }, "invitation": "tc1XfUaFT2zMwHWyODkNmMdYUpOPTAbw"  }}	
#	Response
#	HEAD: 201 Created
#   (end)
#
#   header: get account setting.
#   (start example)
#     GET http://localhost/gdc/account/login/876ec68f5630b38de65852ed5d6236ff
#     Request
#     Response
#     HEAD: 200 OK
#     BODY:
#     --- 
#     accountSetting: 
#       country: UK
#       firstName: Vulpes
#       lastName: Lagopus
#       login: my@email.com
#       phoneNumber: 123456789
#       timezone: 100
#     
#     GET http://localhost/gdc/account/login/876ec68f5630b38de65852ed5d6236ff
#     Request
#     Response
#     HEAD: 404 Not Found
#     BODY: Profile id 404 doesn't exist
#   (end)
#     
#   header: update account setting.
#   (start example)
#     PUT http://localhost/gdc/account/login/876ec68f5630b38de65852ed5d6236ff
#     Request
#     BODY: {"accountSetting":{"country":"UK","firstName":"Vulpes","timezone":"100","licence":1,"verifyPassword":"new_password","login":"my@email.com","password":"new_password","old_password":"old_password","lastName":"Lagopus","phoneNumber":"123456789"}}
#     HEAD: 200 OK
#     BODY:
#     --- 
#     accountSetting: 
#       country: UK
#       firstName: Vulpes
#       lastName: Lagopus
#       login: my@email.com
#       phoneNumber: 123456789
#       timezone: 100
#     
#     
#     PUT http://localhost/gdc/account/login/00000000000000FF0000000000000000
#     Request
#     BODY: {"accountSetting":{"country":"UK","firstName":"Vulpes","timezone":"100","licence":1,"verifyPassword":"new_password","login":"my@email.com","password":"new_password","old_password":"old_password","lastName":"Lagopus","phoneNumber":"123456789"}}
#     Response
#     HEAD: 404 Not Found
#     BODY: Profile id 404 doesn't exist
#   (end)
#
#   header: mockups for /account/profile/<user>/projects
#   (start example)
#	GET http://localhost/gdc/account/profile/876ec68f5630b38de65852ed5d6236ff/projects
#	Response
#	HEAD: 200 OK
#	BODY: 
#	--- 
#	projects: 
#	  - 
#	    project: 
#	      content: 
#	        state: ENABLED
#	      links: 
#	        invitations: /gdc/projects/FoodMartDemo/invitations
#	        self: /gdc/projects/FoodMartDemo
#	        users: /gdc/projects/FoodMartDemo/users
#	      meta: 
#	        author: 
#	          name: ~
#	          uri: /gdc/account/profile/876ec68f5630b38de65852ed5d6236ff
#	        contributor: 
#	          name: ~
#	          uri: /gdc/account/profile
#	        created: 2008-09-02 16:30:36
#	        summary: FoodMartDemo
#	        title: FoodMartDemo
#	        updated: 0000-00-00 00:00:00
#   (end)
#
#   header: mockups for /account/profile/<user>/invitations
#   (start example)
#	GET http://localhost/gdc/account/profile/2/invitations
#	Response
#	HEAD: 200 OK
#	BODY: 
#	--- 
#	invitations: 
#	  - 
#	    invitation: 
#	      content: 
#	        email: jiri.zaloudek9@gooddata.com
#	        firstname: ~
#	        lastname: ~
#	        phonenumber: ~
#	        status: WAITING
#	      links: 
#	        project: /gdc/projects/FoodMartDemo
#	        self: /gdc/projects/FoodMartDemo/invitations/11
#	      meta: 
#	        author: 
#	          name: John Doe
#	          uri: /gdc/account/profile/876ec68f5630b38de65852ed5d6236ff
#	        contributor: 
#	          name: ~
#	          uri: /gdc/account/profile
#	        created: 2008-09-09 11:03:52
#	        modified: 0000-00-00 00:00:00
#	        summary: ~
#	        title: ~
#	  - 
#	    invitation: 
#	      content: 
#	        email: jiri.zaloudek4@gooddata.com
#	        firstname: ~
#	        lastname: ~
#	        phonenumber: ~
#	        status: WAITING
#	      links: 
#	        project: /gdc/projects/FoodMartDemo
#	        self: /gdc/projects/FoodMartDemo/invitations/7
#	      meta: 
#	        author: 
#	          name: John Doe
#	          uri: /gdc/account/profile/876ec68f5630b38de65852ed5d6236ff
#	        contributor: 
#	          name: ~
#	          uri: /gdc/account/profile
#	        created: 2008-09-09 10:43:54
#	        modified: 0000-00-00 00:00:00
#	        summary: ~
#	        title: ~
#   (end)
#

#
################################################################################
# Group: Info
#
# About: Owner(s)
#       Jiri Zaloudek
#
