# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: task
#

###############################################################################
# Group: Description
#
#   Resource providing status of data upload task of pull or push mechanism.
#
#   __Related resources:__
#
#   - /gdc/md/&lt;project&gt;/etl/mode
#   - /gdc/md/&lt;project&gt;/etl/pull
#   - /gdc/md/&lt;project&gt;/ldm/dataloadinterface
#   - /gdc/md/&lt;project&gt;/ldm/singleloadinterface
#

###############################################################################
# Group: Resource(s)
#
#
# Resource:
#
#	Core resource, provides only about structure.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/etl/task
#
#	GET - *
#		-> 200 OK About
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint31
#
# Topic: Description
#
#	Resource covering sub resources with data upload statuses.
#
# Topic: Random Remarks
#
#	--
#
# Topic: Performance mini-status
#
#	--
#
# Topic: Example
#
#	GET, receive About.
#
###############################################################################
# Resource:
#
#	Resource provides status of specific upload task.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/etl/task/<id>
#
#	GET - *
#		-> 200 OK TaskStatus
#		-> 404 NotFound % no such upload info
#		-> 410 Gone % task is in other state than OK,ERROR,RUNNING,PREPARED, ex. DELETED
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint31
#
# Topic: Description
#
#	Access this resource whenever you need to know the status data upload task.
#	As long as you access valid < id > status 200 and TaskStatus are returned,
#	even if the TaskStatus is different from OK. If task timeouts an ERROR
#	TaskStatus is returned.
#
# Topic: Random Remarks
#
#	--
#
# Topic: Performance mini-status
#
#	constant time - reads single record in db
#
# Topic: Example
#
#	GET, receive TaskStatus.
#

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: TaskStatus
#
#	Strucuture with status of data upload task.
#
# Topic: Specification
#
#   (start code)
#   TaskStatus = <
#     taskStatus : WorkerStatus
#   >
#
#   WorkerStatus = 'OK'|'ERROR'|'RUNNING'|'PREPARED'|'WARNING'
#   (end)
#

###############################################################################
# Section: Example
###############################################################################
#
#	{There should be shown and commented example workflow on resources
#	documented in this document}

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	jiri, vlada
#
