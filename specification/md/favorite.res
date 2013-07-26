# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: favorite
#

###############################################################################
# Group: Description
#
#    Mark object as 'favorite'. It is possible to favorite only objects which 
#    has been created by current user or objects which are shared for everyone.
#
#    Attempt to favorite foreign object (where user has no rights) won't fail, 
#    just still returns 0 as object has not been favorized.
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/favorite
#  
#       GET - * -> <About>
#  
#   header: /md/<project>/favorite/<id>
#  
#       GET - * -> <Favorite>
#       PUT - <Favorite> -> <Favorite> % returns state of favorite after PUT 

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Vladimir Vacula
#
