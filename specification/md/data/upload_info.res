# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: data/upload_info
#

###############################################################################
# Group: Description
#
#   __Provides data upload status information.__
#
#   __Related resources:__
#
#   - /gdc/md/<project>/etl/pull
#   - /gdc/md/<project>/data/sets
#   - /gdc/md/<project>/data/upload
#   - /gdc/md/<project>/data/uploads
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/data/uploads_info
#
#	GET - *
#		-> 200 <DataUploadInfo>
#  
#   header: MappingsInfo
#     
#   (start code)
#   DataUploadInfo = < dataUploadsInfo : DataUploadInfoType >
#
#   DataUploadInfoType = {
#		statusesCount : { (DataUploadStatus : INT)* }
#	}
#   UPLOADINFO = {
#      % Contains details about a single upload
#      createdAt : DATETIME,
#      file : STRING,
#      fileSize : INT,
#      (fullUpload : BOOLEAN)?,
#      msg : STRING[1,5000] | NULL,
#      processedAt : DATETIME,
#      status : STRING,
#      progress : FLOAT,
#      (warnings : ANY)?
#   }
#   (end)
#
#   header: MappingsInfo
#
#   (start code)
#	DataUploadStatus = 'PREPARED' | 'RUNNING' | 'OK' | 'ERROR' | 'WARNING'
#   (end)
#
#
