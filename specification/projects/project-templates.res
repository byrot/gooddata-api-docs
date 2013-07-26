# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: project-templates
#

###############################################################################
# Group: Description
#
#  Release information (components, versions...)
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/projects/<project>/project-templates
#
#         POST - CreateProjectTemplate
#           - (201 Created) <CreatingProjectTemplate>
#
#   header: /gdc/projects/<project>/project-templates/tasks/
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
