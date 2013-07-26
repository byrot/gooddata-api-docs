# Copyright (C) 2007-2012, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: attributeupperbound
#

###############################################################################
# Group: Description
#
#   This resource allows you to list set of upper bounds for a set of arbitrary
#   attributes.  Upper  bounds are  computed  with respect  to the  ordering on
#   attributes in LDM. When parameter ``all`` is given and set nonzero, all the
#   upper bounds  are  returned.  Otherwise  only  minimal  upper  bounds  (aka 
#   suprema) are returned.
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/ldm/attributeupperbound
#  
#        POST - <AttributeUpperBounds> -> <AttributeUpperBounds>
#
# Topic: Synopsis
#
#       /md/<project>/ldm/attributeupperbound
#
# (start example)
#   GET *
#     - (200 Ok) <About>
#
#   POST <AttributeUpperBounds>
#     - (200 Ok) <AttributeUpperBoundsResponse>
#     - (400 Bad request) ErrorStruct
# (end)

###############################################################################
# Group: Security Consideration
#
#   header: /md/<project>/ldm/attributeupperbound
#     POST - canInitData

###############################################################################
# Group: Data Structures
#
#   header: AttributeUpperBounds
#
#   (start code)
#	AttributeUpperBounds = < attributeUpperBounds : {
#		attributes : [ URISTRING ],
#		(all : BOOLEAN)?
#	} >
#
#	AttributeUpperBoundsResponse = < attributeUpperBoundsResponse : {
#		upperbounds : [ URISTRING ]
#	} >
#   (end)
#


################################################################################
# Group: Info
#
# About: Owner(s)
#
#   Tomas Jirotka
#
