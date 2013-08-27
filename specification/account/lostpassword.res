# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: lostpassword
#

###############################################################################
# Group: Description
#
#   Resource to set new password if a user forgets the old one.
#
#   __Related resources:__
#
#   - /gdc/account
#   - /gdc/account/login
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/account/lostpassword
#       Ask for new password. Not auth resource. 
#  
#       POST <PostLostPassword>
#         -> (204 No content)
#         -> (400 Bad request)
#
#   header: /gdc/account/lostpassword/<uniquestring>
#   
#       GET
#          -> (200 OK) <LostPasswordRequest>
#          -> (404 Not found)
#
#       POST <PostSetNewPassword>
#
#          -> (200 OK)
#          -> (404 Not found)
#          -> (400 Bad request) <WrongNewPassword>

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/account/lostpassword
#	HEAD: {"login":"user@example.com"}
#	Response
#	HEAD: 204
#   (end)
#
#   (start example)
#	POST /gdc/account/lostpassword/452345wer23as
#	BODY: {"postSetNewPassword":{"password":"new_pass","verifyPassword":"new_pass"}}
#	Response
#	HEAD: 200
#   (end)
#

###############################################################################
# Group: Data Structures
#
#   header: PostLostPassword
#
#   (start code)
#   PostLostPassword = < login : EMAIL >
#   (end)
#
#
#   header: LostPasswordRequest
#   (start code)
#    LostPasswordRequest = < lostPasswordRequest : {
#      login: EMAIL,
#      (captcha : STRING)?,
#      (verifyCaptcha : STRING)?
#    }>
#   (end)
#
#   header: PostSetNewPassword
#
#   (start code)
#    PostSetNewPassword = < postSetNewPassword : {
#       password : STRING,
#       verifyPassword : STRING
#    }>
#   (end)
#
#   header: WrongNewPassword
#
#   (start code)
#    WrongNewPassword = < wrongNewPassword : {
#       (password : INT)? %  0 - password or verifyPassword didn't defined
#                             % -1 - password doesn't match
#    }>
#   (end)
#
