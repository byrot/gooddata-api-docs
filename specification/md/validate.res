# Copyright (C) 2007-2012, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: validate project
#

###############################################################################
# Topic: Description
#
#	Resource capable validate project for ldm, pdm, invalid_objects, ...

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: validate
#
#	Create asynchronous task to run selected validations on project.
#
# Topic: Synopsis
#
#>	 gdc/md/< project >/validate
#
#   (start example)
#	GET *
#		-> (200 OK) <AvailableValidations>
#
#	POST <ValidateProject>
#		-> (201 Created) <AsyncTask>
#		-> (400 Bad request) <ErrorStruct>
#    (end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - since R34, modified in R75
#
# Topic: Description
#
#	Access this resource whenever data were uploaded or model has been changed.
#	Specify proper validation level PDM or LDM or ..., poll over receieved uri
#	with task id until project fully validated. Follow redirections to subtasks
#   and final result.
#
# Topic: Example
#
#	GET, receive About.
#	POST  { validateProject : [ 'ldm', 'pdm' ] },
#	receive URI and follow the link
#
# Topic: Security Consideration
#
#   header: /md/<project>/validate
#     GET - canValidateProject
#     POST - canValidateProject
#

###############################################################################
# Resource: validate-task
#
#	Redirect to another task or to validate-result. Return info about failed
#   running task.
#
# Topic: Synopsis
#
#>	 gdc/md/< project >/validate/task/< task_id >
#
#   (start example)
#	GET *
#       -> (202 Accepted) <WTaskStatus>
#       -> (303 See other) <URIResponse>
#		-> (200 OK) <WTaskStatus> - with status error and error messages
#       -> (404 Not found)
#   (end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since R75
#
# Topic: Description
#
#	Redirect to another task or to validate-result. Return info about failed
#   running task.
#
# Topic: Security Consideration
#
#   header: /md/<project>/validate/task/<task_id>
#     GET - canValidateProject
#

###############################################################################
# Resource: validate-result
#
#	Return validation result structure (ValidateResult).
#
# Topic: Synopsis
#
#>	 gdc/md/< project >/validate/result/< result_id >
#
#   (start example)
#	GET *
#		-> (200 OK) <ProjectValidateResult>
#       -> (404 Not found)
#   (end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since R75
#
# Topic: Description
#
#	Return validation result structure (ValidateResult).
#
# Topic: Security Consideration
#
#   header: /md/<project>/validate/result/<result_id>
#     GET - canValidateProject
#

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: ValidateItem
#
#	List of validation categories available over rest.
#
# Topic: Specification
#
#   (start code)
#   ValidateItem = 'ldm'|'pdm'|'invalid_objects'|'metric_filter'  % This list must fit public available validations.
#   (end)
#

# Structure: ValidateProject
#
#	Strucuture with uri leading to status of executed pull upload
#
# Topic: Specification
#
#   (start code)
#   ValidateProject = < validateProject : [ ValidateItem ] >
#   (end)
#

# Structure: AvailableValidations
#
# 	Structure with links to available validations of project
#
# Topic: Specification
#
# (start code)
#  AvailableValidations = < availableValidations : [ ValidateItem ] >
# (end)
#

# Structure: ProjectValidateResult
#
# 	Full validation structure.
#
# Topic: Specification
#
# (start code)
#  ProjectValidateResult = < projectValidateResult : {
#   meta : {                     % Meta informations.
#     start_time : INT,          % Validation task start date (unix timestamp).
#     finished_time : INT,       % All processing finished date (unix timestamp).
#   },
#   error_found : BOOLEAN,       % Some of validation failed.
#   fatal_error_found : BOOLEAN, % Some fatal error found during running/processing individual validation tasks.
#   results : [
#     ANY                        % Individual results with messages.
#   ]
#  } >
# (end)

# Structure: AsyncTask
#
# Topic: Specification
#
# header: AsyncTask
#  (start code)
#   AsyncTask = <asyncTask : {
#     link : {
#       poll : URISTRING
#     }
#   }>
# (end)

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	Michal Jurosz, Jiri Schmid
#
