# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: Login resource
#

###############################################################################
# Topic: Description
#
#	This resource takes care of authentication of users and it generating secure tokens.
#	https://wiki.gooddata.com/bin/view/Doc/GdcDocumentationAuthServer
#

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: login
#
#	Authenticate users.
#
# Topic: Synopsis
#
#>	/gdc/account/login
#
#   (start example)
#   POST PostUserLogin | PublicAccess
#      -> OK UserLogin # SST was generated and saved to cookie
#      -> (403 Forbiden) ResendRegistration # User was authenticated but wasnt verified
#      -> (400 Bad request) # User wasn't authenticated
#	(end)
#
#   See <PostUserLogin> and <UserLogin> for details about used data sructures.
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - global
# access control - unrestricted
# visibility - public
# state - supported since CS1
#
# Topic: Description
#
#  This resource provide authentication access point to GDC.
#  It is used by the client and generates unique secure token.
#
# Topic: Random Remarks
#
#	{performance, complexity, related resources, etc.}
#
# Topic: Performance mini-status
#
#	stable-17:
#	POST - avg 144ms, median 130ms
#
# Topic: Example
#
#	Login:
#
#	(start example)
#   POST http://localhost/gdc/account/login/
#   Request
#   BODY: {"postUserLogin":{"password":"my_passsword","login":"bad@email.com","remember":"0","vefify_level":"0"}}
#   Response
#   HEAD: 400 Bad Request
#   
#   POST http://localhost/gdc/account/login/
#   Request
#   BODY: {"postUserLogin":{"password":"my_passsword","login":"ok@email.com","remember":"0"}}
#   Response
#   HEAD: 200 OK
#   BODY: 
#   --- 
#   userLogin: 
#     profile: /gdc/account/profile/1234567890
#     state: /gdc/account/login/1234567890
#	(end)
#

###############################################################################
# Resource: logout
#
#	Logout users.
#
# Topic: Synopsis
#
#>	/account/login/$uniquestring
#
#   (start example)
#   DELETE * 
#      -> (204 No Content) #logout
#      -> (401 Unauthorized) # Temporary token has expired
#      -> (404 Not found) # User wasn't log out.(doesn't exists)
#
#	(end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - global
# access control - authorization required
# visibility - public
# state - supported since CS1
#
# Topic: Description
#
#  This resource logout users from GDC.
#  It is used by the client and remove secure token from cookie and C3.
#
# Topic: Random Remarks
#
#	{performance, complexity, related resources, etc.}
#
# Topic: Performance mini-status
#
#	{stable-xx, avg/median time}
#
# Topic: Example
#
#	(start example)
#   DELETE http://localhost/gdc/account/login/200
#   Request
#   Response
#   HEAD: 204 No Content
#   
#   DELETE http://localhost/gdc/account/login/404
#   Request
#   Response
#   HEAD: 404 Not Found
#   BODY: Login id 404 was not found.
#	(end)
#

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: PostUserLogin
#
#	Structure with data identifying the user
#
# Topic: Specification
#
#   (start code)
#    PostUserLogin = < postUserLogin : {
#       login : EMAIL,
#       password : STRING,
#       remember: BOOLEAN,
#       (captcha : STRING)?,
#       (verifyCaptcha : STRING)?,
#       (verify_level: INT)?
#    }>
#   (end)
#
# Topic: Description
#
#	Login and password of users.
#	Validity of a token is specified by remember. If 1 (true) than generated SST will be valid for a very long time (typically one year).
#
#	Verification level specifies checks that are made against temporary token (that's generated for this SST):
#	* Level 0 (default if ommited): Only cookie is checked, useful outside browser (API tools)
#	* Level 1: Check cookie AND X-GDC-Auth header (cross-site request forgery protection in rich client)
#	* Level 2: Only check the header (useful for multiple concurrent sessions in one browser session, where cookie storage is not thread-safe -- public dashboards)
#

###############################################################################
# Structure: PublicAccess
#
#	Structure with data for public access.
#
# Topic: Specification
#
#   (start code)
#    PublicAccess = < publicAccess : {
#       secret : STRING
#    }>
#   (end)
#
# Topic: Example login by publicAccessCode
#   POST http://localhost/gdc/account/login/
#   Request
#   BODY: {"publicAccess":{"secret":"XYZ"}}
#

###############################################################################
# Structure: UserLogin
#
#	Returned structure after successful login.
#
# Topic: Specification
#
#   (start code)
#   UserLogin = < userLogin : {
#      state : URISTRING,
#      profile : URISTRING,
#      (token : STRING)?
#   }>
#   (end)
#
# Topic: Description
#
#	State and profile are URI to resoure that provide info about user.
#
###############################################################################
# Structure: ResendRegistration
#
#	Returned structure after successful login unverified user.
#
# Topic: Specification
#
#   (start code)
#   ResendRegistration = <resendRegistration : { 
#      uri : URISTRING,
#      rsr_token : STRING
#   }>
#   (end)
#
# Topic: Description
#      uri where you have to post rsr_token for mail resending
#
