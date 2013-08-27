# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: releaseInfo
#

###############################################################################
# Group: Description
#
#   Release information (components, versions...)
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/releaseInfo
#   
#         GET - *
#		-> 200 <Release>
#  

###############################################################################
# Group: Data Structures
#
#   header: Release
#
#   (start code)
#   
#	Release = < release : {
#	    releaseId: STRING,       % eg. 'server:44c3fea, client:e853b36, docs:47160de'
#	    releaseName: STRING,     % eg. 'Release 31' or 'Eagle32rc1' or 'Master'
#	    releaseNotesUri: STRING, % eg. 'http://support.gooddata.com'
#	    releaseDate: DATETIME,   % date of release
#	    components: [Component]  % array of components
#	}>
#	
#	Component = < component : { 
#	    name: STRING,           % package name (eg. client)
#	    release: STRING         % package version (eg. 1273767288.e853b36.stable_29) 
#	}>
#   (end)

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
