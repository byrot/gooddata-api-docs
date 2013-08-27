# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: exporter
#

###############################################################################
# Group: Description
#
#   Resource to export report results to PDF/XLS.
#
#   __Related resources:__
#
#   - /gdc/xtab2/executor3
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/exporter
#   
#         GET - *
#		-> 200 <About>
#  
#   header: /gdc/exporter/executor
#
#       GET  - *
#		-> 200 XHTML interface for executor resource
#
#       POST - <ResultReq>
#		-> 201 (Location : URISTRING) % 1
#           % run the execution. URISTRING is place of xtab_result
#  
#   header: /gdc/exporter/result
#   
#           GET - * -> <About>
#  
#   header: /gdc/exporter/result/<result-id>
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
#   header: /gdc/exporter/executor
#      POST - project membership
#  
#   header: /gdc/exporter/result
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
