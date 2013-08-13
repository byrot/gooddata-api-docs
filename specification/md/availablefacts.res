# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: availablefacts
#

###############################################################################
# Group: Description
#
#   Resource providing list of facts usable within a specified report. Due to
#   the report context it is usualy not possible to use any fact, since it
#   is not drillable into the attributes of the report.
#
#   It accepts reportDefinition, Metrics, Facts, Attributes or their
#   combinations.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/availablemetrics
#   - /gdc/md/<project>/drillcrosspaths
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/availablefacts
#           /gdc/md/(\w+)/availablefacts
#  
#          POST - [ URISTRING ] -> <Entries>
#
#   header: /gdc/md/<project>/availablefacts/<id>
#           /gdc/md/(\w+)/availablefacts/(\w+)
#  
#           GET * -> <Entries>
#
###############################################################################
# Group: Mock-up
#
#   (start example)
#     POST /gdc/md/<project>/availablefacts
#     BODY: ["/gdc/md/<project>/obj/1234","/gdc/md/<project>/obj/2345"]
#     Response
#     HEAD: 200
#     BODY: {"entries":[{"link":"/gdc/md/<project>/obj/95","title":"Amount"},{"link":"/gdc/md/<project>/obj/98","title":"Probability"}]}
#   (end)
#
