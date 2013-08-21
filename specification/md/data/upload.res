# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: data/upload
#

###############################################################################
# Group: Description
#
#   __Provides data upload status information.__
#
#   This resource is intended for pooling if upload is in 'RUNNING' state. 
#
#   __Related resources:__
#
#   - /gdc/md/<project>/etl/pull
#   - /gdc/md/<project>/data/sets
#   - /gdc/md/<project>/data/upload_info
#   - /gdc/md/<project>/data/uploads
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/data/upload/<id>
#
#	GET - *
#		-> 200 <DataUpload>
#  
#   header: DataUpload
#     
#   (start code)
#	DataUpload = < dataUpload: {
#	   etlInterface: URISTRING,      % link to etl interface object (md/<project>/obj/<id>)
#	   uri: URISTRING,               % link to data upload structure (self)
#	   createdAt : DATETIME,
#	   file : STRING,
#	   fileSize : INT,
#	   (fullUpload : BOOLEAN)?,
#	   msg : STRING[1,5000] | NULL,
#	   processedAt : DATETIME,
#	   status : STRING,
#	   progress : FLOAT,
#	   (warnings : ANY)?
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
