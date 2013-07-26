# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: maintenance
#
# Project maintenance resources.

###############################################################################
# Topic: Description
#
#   Project maintenance resources. Project exporting and importing. Backup and
#   migration not implemented yet.
#

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: maintenance
#
#   Navigation resource to Maintenance resources.
#
# Topic: Synopsis
#
#> /md/<project>/maintenance
#
#   GET *
#     - (200 Ok) <About>
#

###############################################################################
# Resource: maintenance-cleanup
#
#   wipes out DWH excluding elements referenced from metadata and preserves
#   time dimensions. Technically new table data loads are created with empty
#   dwh tables and tables latest active dataloads point to these new dataloads.
#   If requested time dimension is trimmed within specified time range.
#
# Topic: Synopsis
#
#> /md/<project>/maintenance/cleanup
#
#   GET *
#     - (200 Ok) <About>
#
#   POST <CleanUpProject>
#     - (200 Ok) URI
#     - (204 Ok) - no data in the project, nothing to clean
#     - (400 Bad request) ErrorStruct
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since R73
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Template+creation+-+Deleting+unreferenced+data+from+project
#
# Topic: Performance mini-status
#
#   Asynchronous task (immediate response, but long real task running time).
#

###############################################################################
# Resource: maintenance-export
#
#   Export project resource capable to pack user data, metadata and manifest into
#   artifact file. Provides ExportArtifact structure containing uri to status
#   of task and token (to artifact package file).
#
# Topic: Synopsis
#
#> /md/<project>/maintenance/export
#
#   GET *
#     - (200 Ok) <About>
#
#   POST <ExportProject>
#     - (200 Ok) <ExportArtifact>
#     - (400 Bad request) ErrorStruct
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since Goshawk R52
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Project+Cloning
#
# Topic: Performance mini-status
#
#   Asynchronous task (immediate response, but long real task running time).
#

###############################################################################
# Resource: maintenance-import
#
#   Resource capable to load artifact file (user data and metadata) into empty
#   project. Validates manifest especially user-artifact relation (authorizedUsers
#   value in manifest file).
#
# Topic: Synopsis
#
#> /md/<project>/maintenance/import
#
#   GET *
#     - (200 Ok) <About>
#
#   POST <ImportProject>
#     - URI % etl-task uri
#     - (400 Bad request) ErrorStruct
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since Goshawk R52
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Project+Cloning
#
# Topic: Performance mini-status
#
#   Asynchronous task (immediate response, but long real task running time).
#


###############################################################################
# Resource: maintenance-partial-md-export
#
#   Resource capable to pack user specific metadata and all related.
#   Provides ExportArtifact structure containing uri to status
#   of task and token (to artifact package file).
#
# Topic: Synopsis
#
#> /md/<project>/maintenance/partialmdexport
#
#   GET *
#     - (200 Ok) <About>
#
#   POST <PartialMDExport>
#     - (200 Ok) <PartialMDArtifact>
#     - (400 Bad request) ErrorStruct
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since Hawk R57
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Migrate+MD+object+from+master+project+to+child
#
# Topic: Performance mini-status
#
#   Asynchronous task (immediate response, but long real task running time).
#


###############################################################################
# Resource: maintenance-partial-md-import
#
#   Resource capable to pack user specific metadata and all related.
#   Provides ExportArtifact structure containing uri to status
#   of task and token (to artifact package file).
#
# Topic: Synopsis
#
#> /md/<project>/maintenance/partialmdimport
#
#   GET *
#     - (200 Ok) <About>
#
#   POST <PartialMDImport>
#     - (200 Ok) URI
#     - (400 Bad request) ErrorStruct
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since Hawk R57
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Migrate+MD+object+from+master+project+to+child
#
# Topic: Performance mini-status
#
#   Asynchronous task (immediate response, but long real task running time).
#


###############################################################################
# Section: Security Consideration
###############################################################################
#
#   header: /md/<project>/maintenance/cleanup
#     POST - canMaintainProject
#
#   header: /md/<project>/maintenance/export
#     POST - canMaintainProject
#
#   header: /md/<project>/maintenance/import
#     POST - canMaintainProject
#
#   header: /md/<project>/maintenance/partialmdexport
#     POST - canMaintainProject
#
#   header: /md/<project>/maintenance/partialmdimport
#     POST - canMaintainProject
#

###############################################################################
# Section: Data Structures
###############################################################################
#
###############################################################################
# Structure: CleanUpProject
#
#   Configuration structure for project cleanup resource.
#
# Topic: Specification
#
#   (start code)
#    CleanUpProject = < cleanUpProject : {
#     ( trimDate : {
#		(from : STRING|\d{4}|)?, %YYYY
#       (to : STRING|\d{4}|)?  %YYYY
#	  } )?
#    } >
#   (end)
#
# Topic: Description
#
#    For more info see https://confluence.gooddata.com/confluence/display/analysis/Project+Cloning
#

###############################################################################
# Structure: ExportProject
#
#   Configuration structure for project exporting resource.
#
# Topic: Specification
#
#   (start code)
#    ExportProject = < exportProject : {
#     exportUsers : BOOLEAN,
#     exportData : BOOLEAN,
#     ( authorizedUsers : [ STRING ] )? % list of users (emails) that are authorized to import this package
#   } >
#   (end)
#
# Topic: Description
#
#    For more info see https://confluence.gooddata.com/confluence/display/analysis/Project+Cloning
#

###############################################################################
# Structure: ExportArtifact
#
#    Result returned from project export resource.
#
# Topic: Specification
#
#   (start code)
#   ExportArtifact = < exportArtifact : {
#     status : URI,    % etl-task
#     token : STRING   % identification of export
#   } >
#   (end)
#
# Topic: Description
#
#    For more info see https://confluence.gooddata.com/confluence/display/analysis/Project+Cloning
#

###############################################################################
# Structure: ImportProject
#
#    Configuration structure for project importing resource.
#
# Topic: Specification
#
#   (start code)
#   ImportProject = < importProject : {
#     token : STRING
#   } >
#   (end)
#
# Topic: Description
#
#    For more info see https://confluence.gooddata.com/confluence/display/analysis/Project+Cloning.
#

###############################################################################
# Structure: PartialMDExport
#
#   Configuration structure for project exporting resource.
#
# Topic: Specification
#
#   (start code)
#    PartialMDExport = < partialMDExport : {
#     uris : [ URISTRING ] % list of objects to export
#   } >
#   (end)
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Migrate+MD+object+from+master+project+to+child
#


###############################################################################
# Structure: PartialMDArtifact
#
#    Result returned from project export resource.
#
# Topic: Specification
#
#   (start code)
#   PartialMDArtifact = < partialMDArtifact : {
#     status : URI,    % taskman-task status ( structure wTaskStatus )
#     token : STRING   % identification of export
#   } >
#   (end)
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Migrate+MD+object+from+master+project+to+child
#

###############################################################################
# Structure: PartialMDImport
#
#   Configuration structure for project exporting resource.
#
# Topic: Specification
#
#   (start code)
#    PartialMDImport = < partialMDImport : {
#    	token : STRING,
#    	overwriteNewer : BOOLEAN,    % overwrite UDM/ADM objects without checking modification time, default false
#    	updateLDMObjects: BOOLEAN    % overwrite related LDM objects name, description and tags, default false
#   } >
#   (end)
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Migrate+MD+object+from+master+project+to+child
#


###############################################################################
# Section: Example
###############################################################################
#
#>    ExportProject = < exportProject: '{ "exportUsers": false, "exportData": true, "authorizedUsers": [ "foo@gooddata.com", "bar@gexample.com" ] }' >
#

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#    Jiri Schmid, Michal Jurosz, Vladimir Vacula
#
