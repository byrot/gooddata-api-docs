# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: data/uploads
#

###############################################################################
# Group: Description
#  Provides collection of data uploads with links to data_upload resources and its status. 
#  It returns uploads sorted from newest to oldest. 
#  In first implementation it will returns just first page (30 last uploads). 
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/data/uploads
#
#          GET - * -> <DataUploads>
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
