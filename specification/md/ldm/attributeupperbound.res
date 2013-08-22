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
#   header: /gdc/md/<project>/ldm/attributeupperbound
#  
#        POST - <AttributeUpperBounds>
#		-> 200 <AttributeUpperBounds>
#
# Topic: Synopsis
#
#       /gdc/md/<project>/ldm/attributeupperbound
#

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/ldm/attributeupperbound
#	BODY: {"attributeUpperBounds":{"attributes":["/gdc/md/<project>/obj/123","/gdc/md/<project>/obj/321"],"all":"0"}}
#	Response
#	HEAD: 200
#	BODY: {"attributeUpperBoundsResponse":["/gdc/md/<project>/obj/567"]}
#   (end)
#

###############################################################################
# Group: Security Consideration
#
#   header: /gdc/md/<project>/ldm/attributeupperbound
#     POST - canInitData
#

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
