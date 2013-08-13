# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: availablemetrics
#

###############################################################################
# Group: Description
#
#   Resource providing list of metrics usable within a specified report. Due to
#   the report context it is usualy not possible to use any metric, since it
#   is not drillable into the attributes of the report.
#
#   It accepts reportDefinition, Metrics, Facts, Attributes or their
#   combinations.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/availablefacts
#   - /gdc/md/<project>/drillcrosspaths
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/availablemetrics
#           /gdc/md/(\w+)/availablemetrics
#  
#          POST - [ URISTRING ] -> <Entries>
#
#   header: /gdc/md/<project>/availablemetrics/<id>
#           /gdc/md/(\w+)/availablemetrics/(\w+)
#  
#           GET * -> <Entries>
#

###############################################################################
# Group: Mock-up
#
#   (start example)
#     POST /gdc/md/<project>/availablemetrics
#     BODY: ["/gdc/md/<project>/obj/1234","/gdc/md/<project>/obj/2345"]
#     Response
#     HEAD: 200
#     BODY: {"entries":[{"link":"/gdc/md/<project>/obj/1095","title":"Amount [Sum]"},{"link":"/gdc/md/<project>/obj/1198","title":"Probability [Avg]"}]}
#   (end)
#
