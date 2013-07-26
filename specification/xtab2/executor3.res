# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: xtab2/executor3
#

###############################################################################
# Group: Description
#
#  runs the execution of the Report.
#

###############################################################################
# Group: Resource(s)
#
#   header: /xtab2/executor3
#   
#  POST - <ReportReq>                     % run the execution of report or reportDefinition
#      - (200 Ok) <ExecResult>
#      - (404 Not found)
#

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
