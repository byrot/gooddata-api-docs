# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: favorites/${OBJECT_NAME}
#

###############################################################################
# Group: Description
#
#   Search for objects marked as 'favorite'. Returns only objects which has
#   been created by current user. So the behaviour is more like "my favorites".
#
#   The returned list could be also reduced by type of object (see below):

#  Provides a list of URIs of all specific objects (reports, facts, attributes, 
#  metrics, dimensions, tables or analysis). One can define additional parameters 
#  to return and can constrain resulting set of URIs by POST. Optional parameter
#  *author* specifies author of objects.
#
#    - favorites/attributes
#    - favorites/facts
#    - favorites/metrics
#    - ...

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/favorites
#
#          GET - * -> <Entries>
#  
#   header: /md/<project>/favorites/*
#
#          GET - * -> <Entries>
#
#     Subresources for uri /md/<project>/favorites/*
#     - attributes
#     - comments
#     - dimensions
#     - facts
#     - filters
#     - formats
#     - formats2D
#     - grids
#     - metrics
#     - reportDefinitions

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Vladimir Vacula
#
