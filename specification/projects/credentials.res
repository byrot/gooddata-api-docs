# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: credentials
#
###############################################################################
# Group: Description
#
#   Manage credentials to enable connecting GoodData to external systems,
#   for example AWS, SalesForce and others.
#
###############################################################################
# Group: Resource(s)
#
#   header: /gdc/projects/<project>/credentials/<type>
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
#	POST http://localhost/gdc/projects/ProjectId/credentials/sfdc
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
