# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: exporter
#

###############################################################################
# Group: Description
#
#  exports execution result to PDF/XLS.
#

###############################################################################
# Group: Resource(s)
#
#   header: /exporter
#   
#         GET - * -> <About>
#  
#   header: /exporter/executor
#
#       GET  - * -> XHTML interface for executor resource
#       POST - <ResultReq> -> 201 (Location : URISTRING) % 1
#           % run the execution. URISTRING is place of xtab_result
#  
#   header: /exporter/result
#   
#           GET - * -> <About>
#  
#   header: /exporter/result/Location
#
#        GET - generated document with corresponding MIME type
#         - 200 generated document   %  Result has done, returns data.
#         - 202 NULL (Refresh : INT) % Result has not been done
#         - 204 NULL % Report result is empty
#         - 400 NULL % Malformed reportID
#         - 410 NULL % Not found or gone
#         - 500 NULL % any other error
#  

###############################################################################
# Group: Security Consideration
#
#   header: /exporter/executor
#      POST - project membership
#  
#   header: /exporter/result
#      GET  - project membership
#   

###############################################################################
# Group: Data Structures
#
#   header: ResultReq
#
#   (start code)
#
#    ExecuteResult = {
#      result : ExecResult,
#      (executionContext: URISTRING)?, % filters
#      (format: STRING)?
#    }
#
#    ResultReq = < result_req : ExecuteResult >
#   (end)
################################################################################
# Group: Info
#
# - we removed in R84 from structure ExecuteResult key "report" which held ReportResult2 URI
#
# About: Owner(s)
#
#       Jan Pradac
#
