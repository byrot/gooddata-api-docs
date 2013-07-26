# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: availablefacts
#

###############################################################################
# Group: Description
#
# Provides a list of available metrics for a report. Accepts reportDefinition, Metrics, Facts,
# Attributes. e.x. [ reportDefintion, Metrics ]
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/availablefacts
#           /md/(\w+)/availablefacts
#  
#          POST - [ URISTRING ] -> <Entries>
#
#   header: /md/<project>/availablefacts/<id>
#           /md/(\w+)/availablefacts/(\w+)
#  
#           GET * -> <Entries>
#
