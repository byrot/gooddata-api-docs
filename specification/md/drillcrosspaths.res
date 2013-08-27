# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: drillcrosspaths
#

###############################################################################
# Group: Description
#
#   This resource provides hints for creating valid and meaningful reports.
#   For a given set of metrics, it returns list of attributes, which can be put
#   in the report with the metrics.
#
#   For example, suppose there are two fact tables in the data model,
#   Fact Table 1 with Dimension 1, and Fact Table 2 with Dimension 2,
#   and a shared Dimension 3 joined with both fact tables.
#
#   When you create a metric with fact from the Fact table 1, only
#   attributes from Dimension 1 and 3 are returned by this resource, since it
#   is impossible to drill into Dimension 2 directly from Fact table 1.
#
#   __Related resources:__
#
#    - /gdc/md/<project>/availablemetrics
#    - /gdc/md/<project>/availablefacts
#    - /gdc/md/<project>/ldm/attributeupperbound
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/drillcrosspaths
#
#     POST - [URISTRING]
#		-> 200 <DrillCrossPath>
#
#   header: /gdc/md/<project>/drillcrosspaths/<id>
#
#      GET - *
#		-> 200 <DrillCrossPath>
#

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

###############################################################################
# Group: Mock-up
#
#   header: Get hint
#   (start example)
#	POST /gdc/md/MyGdcProject/drillcrosspaths
#	BODY:
#	---
#	- /gdc/md/MyGdcProject/obj/1218
#	- /gdc/md/MyGdcProject/obj/1168
#	Response
#	HEAD: 200 Ok
#	BODY:
#	--- 
#	drillcrosspath: 
#	  links: 
#	    - 
#	      author: /gdc/account/profile/MyGdcProject
#	      category: attribute
#	      contributor: /gdc/account/profile/MyGdcProject
#	      created: 2013-01-16 10:20:02
#	      deprecated: 0
#	      link: /gdc/md/MyGdcProject/obj/1030
#	      summary: Generic Week based on US Weeks (Sun-Sat)
#	      tags: date week year
#	      title: Week (Sun-Sat) (End Date)
#	      updated: 2013-01-16 10:20:04
#	    - 
#	      author: /gdc/account/profile/MyGdcProject
#	      category: attribute
#	      contributor: /gdc/account/profile/MyGdcProject
#	      created: 2013-01-16 10:20:00
#	      deprecated: 0
#	      link: /gdc/md/MyGdcProject/obj/959
#	      summary: Generic Week based on EU Weeks (Mon-Sun)
#	      tags: date eu week year
#	      title: Week (Mon-Sun) (End Date)
#	      updated: 2013-01-16 10:20:03
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       AQE Team
#
