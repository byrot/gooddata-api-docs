# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: project upload mode
#

###############################################################################
# Group: Description
#
#   __Resource to change or get information about upload mode.__
#
#   Upload mode can be DLI or SLI. SLI uses DLI internally, and provides
#   technical keys auto-generation persistent mechanism. If you choose DLI,
#   you will need to load your own technical keys. In a project you cannot
#   combine both modes, one for some data set, and the second for the rest.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/etl/pull
#   - /gdc/md/<project>/ldm/singleloadinterface
#   - /gdc/md/<project>/ldm/dataloadinterface
#

###############################################################################
# Group: Resource(s)
#
#
# Resource:
#
#    Pull-Mode
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/etl/mode
#
#    GET - *
#        -> (200 Ok) ETLMode
#
#    POST - ETLMode
#        -> (200 Ok) URI
#        -> (400 Bad request) ErrorStruct
#
# Topic: Flags
#
#    See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint42
#
# Topic: Description
#
#    Access this resource whenever you need obtain information
#    which upload mode is used for project and post whenever
#    you need to switch into another mode.
#
# Topic: Random Remarks
#
#    --
#
# Topic: Performance mini-status
#
#    --
#
# Topic: Example
#
#    GET, receive ETLMode.
#

###############################################################################
# Group: Data Structures
#
#
# Structure: ETLMode
#
#    Project upload mode.
#
# Topic: Specification
#
#  (start code)
#  ETLMode = < etlMode : SLIMode | CommonMode >
#
#  SLIMode = {
#    mode: 'SLI',
#    (lookup: LookupMode)?,
#    %ifdef IN_ONLY
#      sli : [ DataSetSLIManifest ]
#    %endif
#   }
#
#  CommonMode = {
#    mode: 'DLI'|'VOID'
#  }
#
#  LookupMode = 'recreate'|'reinit'  % Destroy existing sli lookup and create new one.
#                                    % recreate - use data warehouse and filters to create new sli lookup
#                                    % reinit - reindex full data warehouse on validated projects, not usefull for big project (sli lookup).
#
#  (end)

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/etl/mode
#	BODY: {"etlMode":{"mode":"SLI","sli":[{"dataSetSLIManifest":{"parts":[{"columnName":"f_towns.nm_town","populates":["label.towns.town"],"mode":"FULL","referenceKey":1},{"columnName":"d_towns_country.nm_country","populates":["label.towns.country"],"mode":"FULL","referenceKey":1},{"columnName":"f_towns.f_inhabitants","populates":["fact.towns.inhabitants"],"mode":"FULL"}],"file":"dataset.towns.csv","dataSet":"dataset.towns"}}]}}
#	Response
#	HEAD: 200
#	BODY: {"uri":"/gdc/md/<project>/etl/task/40ab412"}
#   (end)
#
#   (start example)
#	POST /gdc/md/<project>/etl/mode
#	BODY: {"etlMode":{"mode":"DLI"}}
#	Response
#	HEAD: 200
#	BODY: {"uri":"/gdc/md/<project>/etl/task/40ab412"}
#   (end)
#

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#    jiri, vlada
#
