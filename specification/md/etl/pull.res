# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: pull
#

###############################################################################
# Group: Description
#
#   __Resource to start ETL tasks.__
#
#   ETL (extract-transform-load) tasks get data from the staging area,
#   do some transformations (in SLI mode normalisation and SLI hash ID
#   auto-generation), and load data sets into database tables.
#   URI of ETL task status is returned.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/etl/mode
#   - /gdc/md/<project>/etl/task
#   - /gdc/md/<project>/ldm/dataloadinterface
#   - /gdc/md/<project>/ldm/singleloadinterface
#

###############################################################################
# Group: Resource(s)
#
#
# Resource:
#
#	Create etl worker task over specified pull directory and execute it.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/etl/pull
#
#	GET - *
#		-> (200 OK) About
#
#	POST - pullIntegration
#		-> (200 pullTask)
#		-> (400 Bad request) ErrorStruct
#		  - upload.json file not found
#		  - zip decompress failed
#		  - upload.json file not found even after decompress of zip file
#		  - upload.json validation failed
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

###############################################################################
# Group: Security Consideration
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
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/etl/pull
#	BODY: { "pullIntegration" : "staging/2013-08-23/dataset1" }
#	Response
#	HEAD: 200
#	BODY: { "uri" : "/gdc/md/<project>/etl/task/45f12aa" }
#   (end)
#

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	jiri, vlada
#
