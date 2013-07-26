# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: data/upload_info
#

###############################################################################
# Group: Description
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/data/uploads_info
#
#          GET - * -> <DataUploadInfo>
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
