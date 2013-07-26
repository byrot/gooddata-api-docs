# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: project upload mode
#

###############################################################################
# Topic: Description
#
#    Resource providing information about upload mode.

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource:
#
#    Pull-Mode
#
# Topic: Synopsis
#
#>     gdc/md/< project >/etl/mode
#
#   (start example)
#    GET *
#        -> ETLMode
#
#    POST ETLMode
#        -> (200 Ok) URI
#        -> (400 Bad request) ErrorStruct
#    (end)
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
# Section: Data Structures
###############################################################################

###############################################################################
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
# Section: Example
###############################################################################
#
#    {There should be shown and commented example workflow on resources
#    documented in this document}

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#    jiri, vlada
#
