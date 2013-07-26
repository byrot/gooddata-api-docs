# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: /md/<projectId>/userfilters
#

###############################################################################
# Group: Description
#
#      Manage relations user userFilters API
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<projectId>/userfilters
#           ?users=[ URISTRING ]
#           ?userFilters=[ URISTRING ]
#
#           GET - NULL -> UserFilters
#           POST - UserFilters -> UserFiltersUpdateResult
#
#           - parameters "users" and "userFilters" are optional
#           * "users" - limit output of relations only for chosen users
#           * "userFilters" - limit output only for users which has chosen userFilters assigned

###############################################################################
# Group: Data Structures
#
#   header: UserFilters
#
#   (start code)
#   UserFilters = < userFilters: {
#       items : [ UserFilterRelation ],
#       %ifdef OUT_ONLY
#           length              : INT,       % total amount of users with defined userFilter
#           count               : INT,       % amount of returned users
#           offset              : INT        % offset of first item, starts from 0
#       %endif
#   } >
#
#    UserFilterRelation = {
#        user: STRING,
#        userFilters: [ STRING ]
#    }
#
#    UserFiltersUpdateResult = < userFiltersUpdateResult: {
#        successful: [ URISTRING ],
#        failed: [ UserFiltersUpdateResultFailedStructure ]
#    }>
#
#    UserFiltersUpdateResultFailedStructure = {
#        user: URISTRING,
#        message: STRING
#    }
#   (end)
