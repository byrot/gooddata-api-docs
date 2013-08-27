# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: xtab2/executor3
#

###############################################################################
# Group: Description
#
#   __Resource to execute reports.__
#
#   It is possible to start report execution. Call this resource with the
#   report definition, and the execution will start. You will get a link to
#   the data results.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/object
#   - /gdc/md/<project>/dataResult
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/xtab2/executor3
#   
#  POST - <ReportReq>                     % run the execution of report or reportDefinition
#      - (200 Ok) <ExecResult>
#      - (404 Not found)
#

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/xtab2/executor3
#	BODY: {"report_req":{"reportDefinition":"/gdc/md/<project>/obj/3705","format":"pdf"}}
#	Response
#	HEAD: 200
#	BODY: {"execResult":{"reportView":{"reportName":"Total Number of Employees","columnWidths":[],"filters":[],"rows":[],"sort":{"columns":[],"rows":[]},"format":"grid","columns":["metricGroup"],"metrics":[{"format":"#,##0.00","title":"Employees [Sum]","metricId":"/gdc/md/<project>/obj/1200"}]},"reportDefinition":"/gdc/md/<project>/obj/3705","dataResult":"/gdc/md/<project>/dataResult/629410272"}}
#   (end)

###############################################################################
# Group: Security Consideration
#
#   header: /xtab2/executor3
#     POST - project membership

###############################################################################
# Group: Data Structures
#
#   header: ReportReq
#
#   (start code)
#   
#    ExecuteReport = {
#      report : URISTRING,
#     (format : pdf | xls | png | csv)?,
#     (prompts : { (URISTRING : TEXT)* } )?,
#     (timestamp: INT)?, % to simulate report computation at a certain time
#     (timeout: DATETIMEISO)? % if this time expires, report should not be computed/computation should be interrupted
#    } 
#   
#    ExecuteDefinition = {
#     reportDefinition : URISTRING,
#     (format: pdf | xls | png | csv)?,
#     (prompts : { (URISTRING : TEXT)* } )?,
#     (timestamp: INT)?,
#     (timeout: DATETIMEISO)?
#    }
#   
#    ExecuteContent = {
#      definitionContent: {
#        content : ReportDefinition,
#        projectMetadata : URISTRING
#      },
#      (format : pdf | xls | png | csv)?,
#      (prompts : { (URISTRING : TEXT)* } )?,
#      (timestamp: INT)?,
#      (timeout: DATETIMEISO)?
#    }
#
#    ExecutionObject = ExecuteContent | ExecuteReport | ExecuteDefinition
#
#    ReportReq = < report_req : ExecutionObject >
#   (end)

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jan Pradac
#
