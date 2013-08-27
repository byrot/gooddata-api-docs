# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: account
#

###############################################################################
# Group: Description
#
#    __Resource providing information about user accounts.__
#
#    It accepts user profile uris and returns user profile details.
#
#    __Related resources:__
#
#    - /gdc/account/login
#    - /gdc/account/registration
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/account
#  
#           POST - <GetUsersInfo>
#           - (200 OK) UsersInfo % get users info 
#           - (400 Bad Request)  % bad structure
#

###############################################################################
# Group: Data Structures
#
#   header: GetUsersInfo
#
#   (start code)
#    GetUsersInfo  = < getUsersInfo : [URI] >
#   (end)
#
#   header: UsersInfo
#
#   (start code)
#	UsersInfo = < usersInfo : [ UserInfo ] >
#   UserInfo = < userInfo : {
#    self : URISTRING,
#    firstName : STRING,
#    lastName : STRING,
#   } >
#   (end)

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/account
#	BODY: {"getUsersInfo":[{"uri":"/gdc/account/profile/b4ffbc9553"}]}
#	Response
#	HEAD: 200
#	BODY: {"usersInfo":[{"userInfo":{"firstName":"GoodData","self":"/gdc/account/profile/b4ffbc9553","lastName":"Master"}}]}
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Hynek Vychodil
#
