# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: data/uploads
#

###############################################################################
# Group: Description
#
#   __Collects data sets upload history.__
#
#   The resource provides collection of data uploads with links to data_upload
#   resources and their status. The uploads are ordered from the newest to the
#   oldest one.
#
#   __Related resources:
#
#   - /gdc/md/<project>/data/sets
#   - /gdc/md/<project>/data/upload_info
#   - /gdc/md/<project>/data/upload
# 

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/data/uploads
#
#	GET - *
#		-> 200 <DataUploads>
#  
#   header: DataSetsInfo
#     
#   (start code)
#	DataUploads = < dataUploads: {
#	    uploads: [ DataUpload ],        % status of last(newest) 30 uploads
#	    links: {
#	      (etlInterface: URISTRING)?,   % link to data interface object (md/<project>/obj/<id>), in case the loads related to interface not to dataset
#	    }
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
