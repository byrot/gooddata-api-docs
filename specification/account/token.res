# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: Token resource
#

###############################################################################
# Group: Description
#
#   Generate temporary token that is used as authorization cache.
#
#   __Related resources:__
#
#   - /gdc/account/login
#

###############################################################################
# Group: Resource(s)
#
#
# Resource: token
#
#	Generate temporary token from user and validity. Need SST validation.
#
# Topic: Synopsis
#
#	header: /gdc/account/token
#
#    GET - * 
#      -> 200 OK
#      -> (404 Not found) #SST token isn't valid
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
