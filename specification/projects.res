# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: projects
#

###############################################################################
# Group: Description
#
#   __Resource for creating new projects.__
#
#   _Project_ is one of the key entities inside GoodData.  It is a stand-alone
#   solution for your custom BI application, containing analytical database
#   (data mart), users, metrics, reports and dashboards.
#
#   A project can be created empty, or from a template. GoodData templates
#   allow to create many projects with the same data model and dashboards.
#
#   When creating a new project you may set these properties:
#
#    - title (string) : Project name
#    - summary (string) : Brief project description
#    - template (uri) : Location of project template
#    - token (string) : Security key, customer identification
#    - driver (string) : Database engine to be used for data mart
#
#   __Related resources:__
#
#   - /gdc/projects/<project>
#


###############################################################################
# Group: Resource(s)
#
#   header: /gdc/projects
#           Create Project
#           
#    POST - <Project> -> <Uri> (201 Created)
#    GET  - * -> (200 Ok)
#  

###############################################################################
# Group: Data Structures
#
#

###############################################################################
# Group: Mock-up
#
#   header: Create a new project
#   (start example)
#	POST https://secure.gooddata.com/gdc/projects
#	BODY:
#	---
#	project:
#	  meta:
#	    title: Sales
#	    summary: My GoodSales analytics project
#	    projectTemplate: /projectTemplates/GoodSalesDemo/3/
#	  content:
#	    guidedNavigation: 1
#	    driver: Pg
#	    authorizationToken: GDCEXAMPLE
#	Response
#	HEAD: 201 Created
#	BODY:
#	---
#	uri: /gdc/projects/NewProjectId
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
