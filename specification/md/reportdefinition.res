# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: ReportDefinition
#

###############################################################################
# Group: Description
#
#   For list of Reports identificated by URI returns an array of raw ReportDefinitions
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/ReportDefinition
#  
#
#	  POST <ReportDefinitionsReq>
#	      - (200 Ok) <ReportDefinitions>         % Report Definition Array
#	      - (400 Bad Request)                    % Any of URIs do not represents Report object 
#	      - (404 Not found)
#  

###############################################################################
# Group: Data Structures
#
#   header: ReportDefinitionsReq
#
#   (start code)
#		ReportDefinitionsReq = < reportDefinitionsReq : [ URI ] >  
#                                        
#   (end)
#	% { "reportDefinitionsReq": [ { "uri": "/someUristring" }] }
#   % List of Report URIs
#
#   header: ReportDefinitions
#
#   (start code)
#		ReportDefinitions = < reportDefinitions : [ 
#							  { 
#								report: URISTRING, 
#								reportDefinition: ReportDefinition,  % content is ReportDefinitionV1
#								reportMeta: Meta
#							  }]
#	    >
#   (end)

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
