# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: data/sets
#

###############################################################################
# Group: Description
#  Provides collection of data sets with additional status informations.
#  Those are date of last successful upload, status of last upload and link to data_upload resource for last one.
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/data/sets
#
#   GET
#     - (200 OK) DataSetsInfo
#
###############################################################################
# Group: Data Structures
#   header: DataSetsInfo
#
#   (start code)
#   DataSetsInfo = < dataSetsInfo: {
#	    sets: [{
#	        meta: Meta,
#	        etlInterface: URISTRING | NULL,         % link to ETLInterface object (md/<project>/obj/<id>)
#	        dataUploads: URISTRING | NULL,          % link to data_uploads resource, NULL if there is not one
#	        lastSuccess: DATETIME | NULL,           % time stamp of last successful data upload, NULL if there is not any
#	        lastUpload: DataUploadShort | NULL,     % there is NULL value if there is not any upload
#           uploadConfiguration: URISTRING | NULL   % link to data set configuration
#	    }],
#	    links: {}
#     }>
#   (end)
#
#   header: DataUploadShort
#
#   (start code)
#	DataUploadShort = < dataUploadShort: {
#	    uri: URISTRING,              % link to data_upload resource
#	    status: DataUploadStatus,
#	    progress: FLOAT,
#	    date: DATETIME,              % date of last modification (e.g. upload in most cases)
#	    msg: STRING[1,50000] | NULL
#	}>
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
