# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: resendregistration
#

###############################################################################
# Group: Description

###############################################################################
# Group: Resource(s)
#
#   header: /account/resendregistration
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
