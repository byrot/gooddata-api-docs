# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: credentials
#
###############################################################################
# Group: Description
#
#   Credentials related to the project. It can store Salesforce, AWS and other credentials to external systems.
#
###############################################################################
# Group: Resource(s)
#
#   header: /projects/<project>/credentials/<type>
#        %the only allowed type is sfdc
#        GET -
#            - (200 Ok) <Credential>
#            - (404 Not found)
#
#        PUT - <Credential>
#            - (204 OK)
#
#        DELETE
#           - (204 No Content)
#
##############################################################################
# Group: Security Consideration
#
#   header: /projects/<project>/credentials/<type>
#     GET, PUT, DELETE - canManageProject
#
###############################################################################
# Group: Data Structures
#
#   header: Credential
#
#   (start code)
#   Credential = < credential : {
#     key : STRING,
#     (disabled : STRICT_BOOLEAN)?,
#     %ifdef IN_ONLY   
#     secret : STRING
#     %endif 
#   } >
#   (end)
#
###############################################################################
# Group: Mock-up
#
#   header: Set credential
#   (start example)
#	POST http://localhost/gdc/projects/FoodMartDemo/credentials/sfdc
#	BODY: {"credential":{"key":"name@example.org", "secret":"passwordAndSfdcSecretKey"}}
#	Response
#	HEAD: 204 No Content
#   (end)
#
################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Lukas Krecan
#