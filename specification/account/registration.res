# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: registration
#

###############################################################################
# Group: Description
#
#   Resource for user registration and confirmation of registration. 
#   This resource does not require authentication.
#
#   __Related resources:__
#
#   - /gdc/account
#   - /gdc/account/invitations
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/account/registration
#       registers user.
#
#       POST - <PostRegistration>
#            - (201 Created) <RegistrationCreated> 
#            - (400 Bad request) <WrongRegistration>
#
#   header: /gdc/account/registration/<uniquestring>
#       confirms user registration.
#
#       GET - *
#           - (200 Ok) <RegistrationRequest>
#           - (404 Not found)
#
#       DELETE - *
#           - (404 Not found)
#           - (204 No Content)

###############################################################################
# Group: Data Structures
#
#   header: PostRegistration
#
#   (start code)
#   PostRegistration = < postRegistration : {   
#      login : EMAIL,
#      licence : STRING,
#      firstName : STRING[1+],
#      lastName : STRING[1+],
#      (companyName : STRING)?,
#      (position : STRING)?,
#      (timezone : TIMEZONE | NULL )?,
#      (country : COUNTRY)?,
#      (phoneNumber: STRING)?,
#      (role: STRING)?,
#      (industry: STRING)?,
#      password : STRING[7+],
#      verifyPassword : STRING[7+],
#      captcha : STRING,
#      % captchaVerify : STRING,
#      verifyCaptcha : STRING,
#      (verify_level : INT)?,
#   }>
#   (end)
#
#   header: WrongRegistration
#
#   (start code)
#   WrongRegistration = < wrongRegistration : {   
#      (login : INT)?,    %  0 - login does not in accordance to rcf
#                            % -1 - login has been registered
#      (licence  : STRING)?,
#      (firstName  : STRING)?,
#      (lastName  : STRING)?,
#      (companyName : STRING)?,
#      (position : STRING)?,
#      (timezone  : STRING)?,
#      (country  : STRING)?,
#      (phoneNumber : STRING)?,
#      (role: STRING)?,
#      (industry: STRING)?,
#      (password : INT)?, %  0 - password or verifyPassword didn't defined
#                            % -1 - password doesn't match
#      (captcha  : INT)?  % -1 : Failed: code expired
#                            % -2 : Failed: invalid code (not in database)
#                            % -3 : Failed: invalid code (code does not match crypt)
#   }>
#   (end)
#
#   header: RegistrationCreated
#
#   (start code)
#   RegistrationCreated = < registrationCreated : {   
#		(registration_id : STRING)?, % only for testing it could be enabled by Apache const 'devel_env_registration_id'
#		profile : URISTRING,                                                                                                                                                  
#		state : URISTRING                                                                                                                                                       
#   }>
#   (end)
#
#   header: RegistrationRequest
#
#   (start code)
#   RegistrationRequest  = < registrationRequest : {   
#      login : EMAIL,
#      firstName : STRING,
#      lastName : STRING,
#      (companyName : STRING)?,
#      (position : STRING)?,
#      (created : DATETIME)?,
#      (timezone : TIMEZONE | NULL )?,
#      (country : COUNTRY)?,
#      (isactivated : STRING)?,
#      (isdeleted : STRING)?,
#      (phoneNumber: STRING)?,
#      (role: STRING)?,
#      (industry: STRING)?,
#   }>
#   (end)

###############################################################################
# Group: Mock-up
#
#   header: Correct registration
#
#   (start example)
#       POST http://localhost/gdc/account/registration
#       Request
#       BODY: {"postRegistration":{"verifyCaptcha":"STRING","country":"UK","firstName":"Vulpes","timezone":"100","licence":1,"captcha":"STRING","verifyPassword":"new_password","login":"my@email.com","password":"new_password","lastName":"Lagopus","phoneNumber":"123456789"}}
#       Response
#       HEAD: 201 Created
#   (end)
#       
#   header: Wrong registration
#
#   (start example)
#	POST http://localhost/gdc/account/registration
#	Request
#	BODY: {"postRegistration":{"verifyCaptcha":"STRING","country":"UK","firstName":"Vulpes","timezone":"100","licence":1,"captcha":"STRING","verifyPassword":"new__password","login":"my@email@com","password":"new_password","lastName":"Lagopus","phoneNumber":"123456789"}}
#	Response
#	HEAD: 200 Ok
#	BODY:
#	--- 
#	wrongRegistration: 
#	  login: my@email@com
#	  password: 0
#   (end)
#       
#   header: Invalid confirmation
#
#   (start example)
#       DELETE http://localhost/gdc/account/registration/404
#       Response
#       HEAD: 404 Not Found
#   (end)
#       
#   header: Valid confirmation
#
#   (start example)
#       DELETE http://localhost/gdc/account/registration/200
#       Response
#       HEAD: 204 No Content
#   (end)
