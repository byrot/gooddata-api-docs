# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: data/upload
#

###############################################################################
# Group: Description
#  Provides data upload resource. This resource is intended for pooling if upload is in 'RUNNING' state. 

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/data/upload/<id>
#
#          GET - * -> <DataUpload>
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
