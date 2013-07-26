# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: drillcrosspaths
#

###############################################################################
# Group: Description
#
# List of attributes that make sense for drill across (<id> is reportDefinition, metrics, attribute, fact).
# *NOTES*: There can be problems with dimensional metrics. For this type of metric, 
# list of attributes can be incomplete.

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/drillcrosspaths
#            /md/(\w+)/drillcrosspaths
#
#     POST 
#     - [URISTRING] -> <DrillCrossPath>
#
#   header: /md/<project>/drillcrosspaths/<id>
#        /md/(\w+)/drillcrosspaths/(\w+)
#
#      GET - * -> <DrillCrossPath>

###############################################################################
# Group: Data Structures
#
#   header: DrillCrossPath
#
#   (start code)
#   RoleSTR = STRING
# 
#   DrillCrossPath = < drillcrosspath: {
#              links: [ LINK ]
#    }>
#   (end)
#
