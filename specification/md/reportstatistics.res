# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: reportstatistics 
#

###############################################################################
# Group: Description
#
#	**THIS RESOURCE IS DEPRECATED**
#
#    For specified report(s) obtains all asociated comments and
#    snapshost (reportDefinition).
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/reportstatistics
#           /gdc/md/(\w+)/reportstatistics
#
#           POST - <RepoStatisticsRequest> -> (200 ok) <ReportStatistics>
#           GET  - * -> <About>
#  
#   header: /gdc/md/<project>/reportstatistics/id
#           /gdc/md/<project>/reportstatistics/(\w+)
#           
#           GET - * - > 200 ReportStatistics

###############################################################################
# Group: Data Structures
#
#   header: ReportStatisticsRequest
#
#   (start code)
#   ReportStatisticsRequest = < reportStatisticsRequest : [ URISTRING ] >
#   (end)
#
#   header: ReportStatistics
#
#   (start code)
#   ReportStatistics = < reportStatistics : [ ReportStatisticsItem ]>
#   (end)
#
#   header: ReportStatisticsItem
#
#   (start code)
#    ReportStatisticsItem = {
#        uri : URISTRING,
#        snapshots : INT,
#        comments : INT
#    }
#   (end)
#

###############################################################################
# Group: Usage
#
#    One can POST a list of report uris to *.../md/.../reportstatistic* resource, 
#    or GET on reportstastic/reportID.
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Schmit
#
