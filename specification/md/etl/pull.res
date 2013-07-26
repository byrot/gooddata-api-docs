# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: pull
#

###############################################################################
# Topic: Description
#
#	Resource capable start loading data into DWH from pull directory
#	It creates an etl worker task and starts it. Provides uri to status
#	of task.

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource:
#
#	Create etl worker task over specified pull directory and execute it.
#
# Topic: Synopsis
#
#>	 gdc/md/< project >/etl/pull
#
#   (start example)
#	GET *
#		-> OK About
#
#	POST pullIntegration
#		-> pullTask
#		-> (400 Bad request) ErrorStruct
#		  - upload.json file not found
#		  - zip decompress failed
#		  - upload.json file not found even after decompress of zip file
#		  - upload.json validation failed
#    (end)
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
#	Access this resource whenever data were uploaded to user space. Specify the
#	directory with these data and invoke data processing. As far the process started 
#	you receive an uri where can be checked the status of upload.
#
# Topic: Random Remarks
#
#	Resource will copy uploaded files into internal storage (to avoid runtime modifications)
#	and this may take a while.
#
# Topic: Performance mini-status
#
#	--
#
# Topic: Example
#
#	GET, receive About.
#	POST  { dliRequest : { dataSet = "dataset.one" } },
#	receive DLILinks and follow one of required link
#
# Topic: Security Consideration
#
#   header: /md/<project>/ldm/manage
#     POST - canRefreshData
#

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: PullIntegration
#
#	Strucuture with pull directory to grab data for upload.
#
# Topic: Specification
#
#   (start code)
#   PullIntegration = <
#     pullIntegration : STRING  % directory path, no path modifiers allowed
#   >
#   % event store integration, compatible with SLI
#   PullESIntegration = <
#     pullESIntegration : STRING  % directory path, no path modifiers allowed
#   >
#   (end)
#
# Structure: PullTask
#
#	Strucuture with uri leading to status of executed pull upload
#
# Topic: Specification
#
#   (start code)
#   PullTask = <
#     pullTask : URI  % gdc/md/< project >/etl/task/id, id = etl_upload primary key
#   >
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
