# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: account
#

###############################################################################
# Group: Description
#    Resource for getting users info   
#    It accepts user profile uris and will return user profile details for them. 
#    In details will be email, firstname and lastname.
#
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
#	

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Hynek Vychodil
#
