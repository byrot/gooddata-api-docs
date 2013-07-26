# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: SingleLoadInterface
#
#	Provides DataSetSLI and Manifest structure for specified dataset.

###############################################################################
# Topic: Description
#
#	Tree of links for datasetsli, manifest and all in one zipped container.
#	Also a POST method is allowed to get an answer for specific dataset.

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: 
#
#	SingleLoadingInterface root, provides About structure.
#
# Topic: Synopsis
#
#	/md/<project>/ldm/singleloadinterface
#
#   (start example)
#	GET *
#		-> OK About
#		-> (404 Not Found) * % Key is not defined
#
#	POST SLIRequest
#		-> OK SLILinks
#		-> (400 Bad request) ErrorStruct % Request is wrong
#		-> (404 Not Found) *             % Key is not defined
#    (end)
#
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint30
#
# Topic: Description
#
#	Access this resource whenever you need to ensure you are on resource 
#	with data loading interface capabilities.
#
# Topic: Random Remarks
#
#	Depends on DataSet amount
#
# Topic: Performance mini-status
#
#	--
#
# Topic: Example
#
#	GET, receive About, follow one of links.
#	POST SLIRequest { sliRequest : { dataSet = "dataset.one" } },
#	receive SLILinks and follow one of required link


###############################################################################
# Resource: 
#
#	Dataset SingleLoadingInterface, provides SLILinks for specific resource.
#
# Topic: Synopsis
#
#	/md/<project>/ldm/singleloadinterface/<dataset>
#
#   (start example)
#	GET *
#		-> OK SLILinks
#		-> (404 Not Found) * % Key is not defined
#    (end)
#
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint30
#
# Topic: Description
#
#	Access this resource whenever you need link to one of specific parts of interface.
#
# Topic: Random Remarks
#
#	Performace depends on amount of attributes related to dataset
#
# Topic: Performance mini-status
#
#	--
#
# Topic: Example
#
#	GET, receive receive SLILinks and follow one of available
#	links of categroy manifest or interface or templates


###############################################################################
# Resource: 
#
#	DataSetSingleInterface, provides DataSetSLI stucture
#
# Topic: Synopsis
#
#	/md/<project>/ldm/singleloadinterface/<dataset>/descriptor
#
#   (start example)
#	GET *
#		-> OK DataSetSLI
#		-> (404 Not Found) * % Key is not defined
#   (end)
#
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint30
#
# Topic: Description
#
#	Access this resource whenever you need parseable structure describing
#	data files used for upload.
#
# Topic: Random Remarks
#
#	Performace depends on amount of attributes related to dataset
#
# Topic: Performance mini-status
#
#	--
#
# Topic: Example
#
#	GET, receive DataSetSLI, parse structure and prepare data for upload


###############################################################################
# Resource: 
#
#	DataSetSLIManifest, provides Manifest stucture
#
# Topic: Synopsis
#
#	/md/<project>/ldm/singleloadinterface/<dataset>/manifest
#
#   (start example)
#	GET *
#		-> OK DataSetSLIManifest
#		-> (404 Not Found) * % Key is not defined
#   (end)
#
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint30
#
# Topic: Description
#
#	Access this resource whenever you have prepared data for upload
#	and you know which file will overwrite, append existing data.
#	This file must be added to uploaded data.
#
# Topic: Random Remarks
#
#	Performace depends on amount of attributes related to dataset
#
# Topic: Performance mini-status
#
#	--
#
# Topic: Example
#
#	GET, receive DataSetSLIManifest, define upload mode, upload data.


###############################################################################
# Resource: 
#
#	DataSetSLITemplates, provides zipped package with DataSetSLIManifest and CSV templates.
#
# Topic: Synopsis
#
#	/md/<project>/ldm/singleloadinterface/<dataset>/template
#
#   (start example)
#	GET *
#		-> OK TemplatesArchive
#		-> (404 Not Found) * % Key is not defined
#   (end)
#
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint30
#
# Topic: Description
#
#	Access this resource whenever you need a template of files, that
#	must be used to populate new data.
#	Supported mime type is application/zip only.
#
# Topic: Random Remarks
#
#	Performace depends on amount of attributes related to dataset
#
# Topic: Performance mini-status
#
#	--
#
# Topic: Example
#
#	GET, receive DataSetSLITemplates, unzip, explore templates, populates
#	templates with new data, set up upload mode, upload new data.

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: DataSetSLI
#
#	Dataset specific loading interface, desribes columns required in
#	data files to populate specific attributes related to dataset.
#
# Topic: Specification
#
#   (start code)
#	DataSetSLI = < dataSetSLI : SLIContent >
#
#	SLIContent = {
#	  dataSet: Identifier, % dataset identifier
#	  file: STRING,        % expected filename (can't contain ~, /, and two or more dots '..')
#	  parts: [ {
#	    populates: [Identifier], % label/fact identifiers to be populated
#	    columnName: STRING,    % name of the column in CSV
#	    (referenceKey: STRING)?, 
#	    (constraints: {
#              date: STRING %DateFormat
#           })?
#	  } ]
#	}
#   (end)
#
#
# Structure: DataSetSLIManifest
#
#	Dataset specific upload interface, describes uplod mode and
#	file names.
#
# Topic: Specification
#
#   (start code)
#	DataSetSLIManifest = < dataSetSLIManifest: SLIManifestContent >
#
#	SLIManifestContent = {
#	  dataSet: Identifier, % dataset identifier
#	  file: STRING,        % csv file name (can't contain ~, /, and two or more dots '..')
#	  (csvParams: SLI_PARSE_PARAMS)?,
#	  parts: [ {
#	    populates: [Identifier], % label/fact identifiers to be populated
#	    columnName: STRING,    % name of the column in CSV
#	    (referenceKey: STRING)?,
#	    (constraints: {
#              date: STRING %DateFormat
#           })?,
#	    mode: 'FULL'|'INCREMENTAL'|'NONE',
#	  } ]
#	}
#
#       SLI_PARSE_PARAMS = {
#         quoteChar: STRING[1+],
#         escapeChar: STRING[1+],
#         separatorChar: STRING[1+],
#         endOfLine: STRING[1+]
#       }
#   (end)
#
#
# Structure: DataSetSLITemplates
#
# 	This resource provides zip commpressed DataSetSLITemplates and json 
# 	seriallized DataSetSLIManifest. Each DataSetSLITemplate presents single
# 	csv file and the structure describes content of that file.
#
# Topic: Description
#  This structure is not intended to be outputed in serialized form (yaml,json...)
#  It is needed to pass validation before outputting through application/zip media handler
#  that produces a binary stream.
#
# Topic: Specification
#
#   (start code)
#     SLITemplateArchive = < sliTemplateArchive : {
#	dataSetSLITemplates : {
#	  dataSet: Identifier,   % dataset identifier
#	  file: STRING,   % dataset identifier
#	  columns: [ STRING ]
#	},
#	dataSetSLIManifest: SLIManifestContent,
#	dataSetSLI: SLIContent
#     } >
#   (end)
#
#
# Structure: SLIRequest
#
#	Specification which DataSet should be processed.
#
# Topic: Specification
#
#   (start code)
#	SLIRequest = < sliRequest : {
#		dataSet : Identifier
#	} >
#   (end)
#
# Structure: SLILinks
#
#	SLILinks links to specific parts of data loading interface
#
# Topic: Specification
#
#   (start code)
#	SLILinks = < sliLinks : {
#		dataSet : Identifier,	% related dataset
#		descriptor : URI,	% interface descriptive structure
#		manifest : URI,		% data upload descriptive structure
#		template : URI,		% compressed file with csv templates and json seriallized manifest
#	} >
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
#	jiri, vlada
#
