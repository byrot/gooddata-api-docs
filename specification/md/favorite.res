# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: favorite
#

###############################################################################
# Group: Description
#
#    __Resource managing user's favorite objects.__
#
#    The resource returns information whether an object is favorite, or
#    mark object as favorite. It is possible to favorite only objects which 
#    has been created by current user or objects which are shared for everyone.
#
#    Attempt to favorite foreign object (where user has no rights) won't fail, 
#    just still returns 0 as object has not been favorized.
#
#    __Related resources:__
#
#    - /gdc/md/<project>/obj
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/favorite
#  
#       GET - *
#		-> 200 <About>
#  
#   header: /gdc/md/<project>/favorite/<id>
#  
#       GET - *
#		-> 200 <Favorite>
#       PUT - <Favorite>
#		-> 200 <Favorite> % returns state of favorite after PUT 
#

###############################################################################
# Group: Mock-up
#
#   (start example)
#     PUT /gdc/md/<project>/favorite
#     BODY: {"favorite":"1"}
#     Response
#     HEAD: 200
#     BODY: {"favorite":"1"}
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Vladimir Vacula
#
