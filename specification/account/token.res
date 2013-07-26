# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: Token resource
#

###############################################################################
# Topic: Description
#
#   Generate temporary token, that is used as authorization cache.
#
#   https://wiki.gooddata.com/bin/view/Doc/GdcDocumentationAuthServer
#

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: token
#
#	Generate temporary token from user and validity. Need SST validation.
#
# Topic: Synopsis
#
#>	/account/token
#
#   (start example)
#    GET - * 
#      -> OK
#      -> (404 Not found) #SST token isn't valid
#	(end)
#
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
#  This resource need SST cookie in request header. This SST is validate and new TT is generated.
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
#   (start example)
#    GET http://localhost/gdc/account/token
#    Response return 
#    HEAD: 404 Not Found
#    BODY: Token doesn't exist
#    or 
#    HEAD: 200 OK
#   (end)
#
###############################################################################
# Structure: UserToken
#
#    Temporary token for level 2 authentication (see login resource).
#
# Topic: Specification
#
#   (start code)
#   UserToken = < userToken : {
#      (token : STRING)?
#   }>
#   (end)
#
# Topic: Description
#
#       Token to be used in X-GDC-Auth header
#
