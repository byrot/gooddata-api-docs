# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: resendregistration
#

###############################################################################
# Group: Description
#
#   Resource to resend registration confirmation.
#
#   __Related resources:__
#
#   - /gdc/account/registration
#   - /gdc/account/invitation
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/account/resendregistration
#       registers user.
#
#       POST - <Rsr_token>
#            - (204 Ok)
#            - (404 Not found)
#       GET, PUT, DELETE - *
#            - (405 Method Not Allowed) 
#

###############################################################################
# Group: Data Structures
#
#   header: Rsr_token
#
#   (start code)
#   Rsr_token = < rsr_token : STRING >
#   (end)
#

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/account/resendregistration
#	BODY: {"rsr_token":"sdfozgaer"}
#	Response
#	HEAD: 204
#   (end)
#
