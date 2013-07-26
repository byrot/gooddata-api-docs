# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: availablemetrics
#

###############################################################################
# Group: Description
#
# Provides a list of available facts for a report. Accepts reportDefinition, Metrics, Facts,
# Attributes. e.x. [ reportDefintion, Metrics ]
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/availablemetrics
#           /md/(\w+)/availablemetrics
#  
#          POST - [ URISTRING ] -> <Entries>
#
#   header: /md/<project>/availablemetrics/<id>
#           /md/(\w+)/availablemetrics/(\w+)
#  
#           GET * -> <Entries>
#
