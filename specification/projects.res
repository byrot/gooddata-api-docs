# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: projects
#

###############################################################################
# Group: Description
#
#   Project users management.
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /projects
#           Create Project
#           
#    POST - <Project> -> <Uri> (201 Created)
#    GET  - * -> (200 Ok) ListOfProjects %???
#    % note: GET method is not currently supported. It should return list of all projects in system. 
#    % An question to be answered: Who will have permitions to call this resource?   
#  

###############################################################################
# Group: Data Structures
#
#



###############################################################################
# Group: Mock-up
#
#   header: create a new project
#   (start example)
#	POST http://localhost/gdc/projects
#	BODY: {"project": {"meta": {"title": "NewProject", "summary": "A new project" }, "content": {"guidedNavigation": 1, "driver": "Pg"} } }
#	Response
#	HEAD: 201 Created
#	BODY: {"uri":"/gdc/projects/FoodMartDemo"}
#   (end)
#


################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
