# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: userfilters
#

###############################################################################
# Group: Description
#
#   Assign user filters to users.
#
#   __Related resources:__
#
#   - /gdc/account
#   - /gdc/md/<project>/obj
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/userfilters
#           ?users=[ URISTRING ]
#           ?userFilters=[ URISTRING ]
#
#           GET - NULL
#		-> 200 UserFilters
#           POST - UserFilters
#		-> 200 UserFiltersUpdateResult
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
#

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/userfilters
#	BODY: {"userFilters":{"items":[{"user":"/gdc/account/profile/0876f4a","userFilters":["/gdc/md/<project>/obj/3440"]}]}}
#	Response
#	HEAD: 200
#	BODY: {"userFilters":{"count":20,"length":1,"offset":0,"items":[{"userFilters":["/gdc/md/<project>/obj/3440"],"user":"/gdc/account/profile/0876f4a"}]}}
#   (end)
#
