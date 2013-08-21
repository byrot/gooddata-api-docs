# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: dml-manage
#

###############################################################################
# Group: Description
#
#   __Data manipulation language resource.__
#
#   GoodData DML is language to delete data from the project data marts.
#   A statement posted to this resource is parsed and processed: an etl task
#   is started to do the job. URI to status of the task is returned.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/maqlvalidator
#   - /gdc/md/<project>/ldm/manage2
#

###############################################################################
# Group: Resource(s)
#
#
# Resource: dml
#
#	Navigation resource to DML resources.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/dml
#
#	GET - *
#		-> 200 About
#
#
#
# Resource: dml-manage
#
#	Manage warehouse data with MAQL DML commands.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/dml/manage
#
#	GET - *
#		-> (200) About
#
#	POST - Manage
#		-> (201) URI
#		-> (400 Bad request) ErrorStruct
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since Falcon R51
#
# Topic: Description
#
#	https://confluence.gooddata.com/confluence/display/analysis/Delete+data+from+project
#
# Topic: Performance mini-status
#
#	Asynchronous task (immediate response, but long real task running time).
#
# Topic: Example
#
#	https://confluence.gooddata.com/confluence/display/analysis/Delete+data+from+project
#
# Topic: Security Consideration
#
#   header: /md/<project>/dml/manage
#     POST - canInitData
#

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/dml/manage
#	BODY: {"manage":{"maql":"DELETE FROM {attr.factsof} WHERE {label.created.iso} BETWEEN \"2010-01-01\" AND \"2010-12-31\";"}}
#	Response
#	HEAD: 201
#	BODY: {"uri":"/gdc/md/<project>/etltask/115bded"}
#   (end)
#

################################################################################
# Group: Info
################################################################################
#
# About: Owner(s)
#
#	Jiri Schmid, Michal Jurosz, Vladimir Vacula
#
