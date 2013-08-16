# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: ReportDefinition
#

###############################################################################
# Group: Description
#
#   __Manage report definitions.__
#
#   Any report has at least one report definition. Report defition contains
#   data about metrics, attributes and filters which are in the report.
#   Report definitions provide versioning of reports.
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/reportdefinition
#  
#
#	  POST - <ReportDefinitionsReq>
#	      -> 200 Ok <ReportDefinitions>         % Report Definition Array
#	      -> 400 Bad Request                    % Any of URIs do not represents Report object 
#	      -> 404 Not found
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

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/reportdefinition
#	BODY: {"reportDefinitionsReq":["/gdc/md/<project>/obj/876"]}
#	Response
#	HEAD: 200
#	BODY: {"reportDefinitions":[{"report":"/gdc/md/<project>/876","reportDefinition":"/gdc/md/<project>/obj/875","reportMeta":{"title":"Revenue By Regions"}}]}
#   (end)

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
