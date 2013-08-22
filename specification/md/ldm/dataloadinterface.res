# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: DataLoadInterface
#

###############################################################################
# Group: Description
#
#   __Provides DataSetDLI and Manifest structure for specified dataset.__
#
#   It is possible to use the dataset templates to load your own data.
#   Just fill the CSV with your data, upload to staging area, and start ETL.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/etl/pull
#   - /gdc/md/<project>/ldm/singleloadinterface
#

###############################################################################
# Group: Resource(s)
#
#
# Resource: 
#
#	DataLoadingInterface root, provides About structure.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/ldm/dataloadinterface
#
#	GET - *
#		-> (200 OK) About
#		-> (404 Not Found) * % Key is not defined
#
#	POST - DLIRequest
#		-> (200 OK) DLILinks
#		-> (400 Bad request) ErrorStruct % Request is wrong
#		-> (404 Not Found) *             % Key is not defined
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
#	POST DLIRequest { dliRequest : { dataSet = "dataset.one" } },
#	receive DLILinks and follow one of required link
#
#
###############################################################################
# Resource:
#
#	Dataset DataLoadingInterface, provides DLILinks for specific resource.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/ldm/dataloadinterface/<dataset>
#
#	GET - *
#		-> (200 OK) DLILinks
#		-> (404 Not Found) * % Key is not defined
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
#	GET, receive receive DLILinks and follow one of available
#	links of categroy manifest or interface or templates


###############################################################################
# Resource:
#
#	DataSetInterface, provides DataSetDLI stucture
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/ldm/dataloadinterface/<dataset>/descriptor
#
#	GET - *
#		-> (200 OK) DataSetDLI
#		-> (404 Not Found) * % Key is not defined
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
#	GET, receive DataSetDLI, parse structure and prepare data for upload


###############################################################################
# Resource: 
#
#	DataSetManifest, provides Manifest stucture
#
# Topic: Synopsis
#
#	/gdc/md/<project>/ldm/dataloadinterface/<dataset>/manifest
#
#	GET - *
#		-> (200 OK) DataSetManifest
#		-> (404 Not Found) * % Key is not defined
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
#	GET, receive DataSetManifest, define upload mode, upload data.


###############################################################################
# Resource: 
#
#	DataSetTemplates, provides zipped package with DataSetManifest and CSV templates.
#
# Topic: Synopsis
#
#	/gdc/md/<project>/ldm/dataloadinterface/<dataset>/template
#
#	GET - *
#		-> (200 OK) TemplatesArchive
#		-> (404 Not Found) * % Key is not defined
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
#	GET, receive DataSetTemplates, unzip, explore templates, populates
#	templates with new data, set up upload mode, upload new data.


###############################################################################
# Resource: DataSetLDMDLI
#
#	DataSetLDMDLI, provides conversion ldm dli structure
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/ldm/dataloadinterface/<dataset>/ldmdli
#
#	GET - *
#		-> (200 OK) DataSetLDMDLI
#		-> (404 Not Found) * % Key is not defined
#
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since sprint46
#
# Topic: Description
#
#	Access this resource whenever you need map of logical object
#	to physical tables in DWH
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
#	GET, receive DataSetLDMDLI
#
#
###############################################################################
#
#	header: /gdc/md/<project>/ldm/dataloadinterface/<dataset>/template
#
#	GET - *
#		-> (200 OK)
#
###############################################################################
#
#	header: /gdc/md/<project>/ldm/dataloadinterface/<dataset>/manifest
#
#	GET - *
#		-> (200 OK)
#


###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: DataSetDLI
#
#	Dataset specific loading interface, desribes columns required in
#	data files to populate specific attributes related to dataset.
#
# Topic: Specification
#
#   (start code)
#	DataSetDLI = < dataSetDLI : DLIContent >
#
#	DLIContent = {
#	  dataSet: Identifier,   % dataset identifier
#	  parts: [ {
#	    populates: Identifier, % attribute identifiers to be populated
#	    file: STRING,       % expected filename
#	    checkSum: STRING, % fingerprint
#	    columns: [ {
#	      name: STRING,
#	      type: STRING,    % int, decimal, date, varchar ...
#	      (constraint: STRING)?
#	    } ]
#	  } ]
#	}
#   (end)
#
#
# Structure: DataSetManifest
#
#	Dataset specific upload interface, describes uplod mode and
#	file names.
#
# Topic: Specification
#
#   (start code)
#	DataSetManifest = < dataSetManifest: ManifestContent >
#
#	ManifestContent = {
#	  dataSet: Identifier,   % dataset identifier
#	  parts: [ {
#	    populates: Identifier, % attribute identifier to be populated
#	    file: STRING,       % csv file name
#	    checkSum: STRING, % fingerprint
#	    mode: 'FULL'|'INCREMENTAL'|'NONE',
#	  } ]
#	}
#   (end)
#
#
# Structure: DataSetTemplates
#
# 	This resource provides zip commpressed DataSetTemplates and json 
# 	seriallized DataSetManifest. Each DataSetTemplate presents single
# 	csv file and the structure describes content of that file.
#
# Topic: Specification
#
#   (start code)
#	CSVTEMPLATE = [ STRING ]   % list of column names
#   (end)
#
# Topic: Description
#  This structure is not intended to be outputed in serialized form (yaml,json...)
#  It is needed to pass validation before outputting through application/zip media handler
#  that produces a binary stream.
#
#   (start code)
#     TemplateArchive = < templateArchive : {
#	dataSetTemplates : {
#	  dataSet: Identifier,   % dataset identifier
#	  parts: [ {
#	    file: STRING,       % csv file name
#	    columns: [ STRING ]
#	  } ]
#	},
#	dataSetManifest: ManifestContent,
#	dataSetDLI: DLIContent
#     } >
#   (end)
#
#
# Structure: DataSetLDMDLI
#
#	Dataset specific mapping of logical object to physical tables.
#
# Topic: Specification
#
#   (start code)
#	DataSetLDMDLI = < dataSetLDMDLI: LDMDLIContent >
#
#	LDMDLIContent = {
#	  dataSet: Identifier,   % dataset identifier
#	  parts: [ {
#	    populates: Identifier, % attribute identifier to be populated
#	    file: STRING,       % csv file name
#	    columns: [ {
#	      name: STRING,
#	      preferred: Identifier,
#	      relates: [ Identifier ]
#	    } ]
#	  } ]
#	}
#   (end)
#
#
# Structure: DLIRequest
#
#	Specification which DataSet should be processed.
#
# Topic: Specification
#
#   (start code)
#	DLIRequest = < dliRequest : {
#		dataSet : Identifier
#	} >
#   (end)
#
# Structure: DLILinks
#
#	DLILinks links to specific parts of data loading interface
#
# Topic: Specification
#
#   (start code)
#	DLILinks = < dliLinks : {
#		dataSet : Identifier,	% related dataset
#		descriptor : URI,	% interface descriptive structure
#		manifest : URI,		% data upload descriptive structure
#		template : URI,		% compressed file with csv templates and json seriallized manifest
#		ldmdli : URI,		% ldm to dli descriptive structure
#	} >
#   (end)
#


################################################################################
# Group: Info
################################################################################
#
# About: Owner(s)
#	jiri, vlada
#
