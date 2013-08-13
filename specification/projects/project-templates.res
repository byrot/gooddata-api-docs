# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: project-templates
#

###############################################################################
# Group: Description
#
#   __Create GoodData template from your project at this resource.__
#
#   Project templates serves as reusable templates to create projects with the
#   same data model, metrics, reports, and dashboards. You may create as many
#   similar projects as you want, and manage them from a single point.
#   Project data are not included in the templates.
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/projects/<project>/project-templates
#
#         POST - CreateProjectTemplate
#           - (201 Created) <CreatingProjectTemplate>
#
#   header: /gdc/projects/<project>/project-templates/tasks
#
#         GET - *
#           - (200 OK) <ProjectTemplateTask>
#           - (202 OK) <ProjectTemplateTask>
#           - (410 Gone)
#

###############################################################################
# Group: Data Structures
#
#   header: CreateProjectTemplate
#
#   (start code)
#    CreateProjectTemplate = <createTemplate : {
#        name : STRING|^\w+$|,
#        version : INT,
#        (title : STRING)?,
#        (summary : STRING)?,
#        (uploader_email : STRING)?,
#        (date_trim : {
#			(from: INT)?,
#			(to: INT)?,
#        })?,
#        (preserved_datasets : [ STRING ])?, % dataset identifiers
#        (labels : STRING)?
#    }>
#   (end)
#
#   header: CreatingProjectTemplate
#
#   (start code)
#
#    CreatingProjectTemplate = <creatingProjectTemplate : {
#        task_uri : URISTRING,
#    }>
#   (end)
#
#   header: ProjectTemplateTask
#
#   (start code)
#    ProjectTemplateTask = <projectTemplateTask : {
#         status : STRING,
#         (uri : URISTRING)?,
#    }>
#   (end)
#
#   The field 'uri' points to the newly created project template in the project
#   staging area.
#
###############################################################################
# Group: Mock-up
#
#   header: Create new template
#   (start example)
#     POST /gdc/projects/<project>/project-templates
#     BODY: {"createTemplate":{"name":"sftemplate","version":"1","title":"SalesForce Template","summary":"This is a template for Sales Force analytics","date_trim":{"from":"40000","to":"50000"}}}
#     Response
#     HEAD: 201
#   (end)
#
