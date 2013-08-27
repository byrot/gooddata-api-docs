# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: Client export
#

###############################################################################
# Group: Description
#
#	Export URL to PDF with headless Webkit browser.
#

###############################################################################
# Group: Resource(s)
#
#	header: /gdc/projects/<project>/clientexport
#	POST - <ClientExportReq>
#       	- (202 Accepted) <AsyncTask>   % poll uri, structure defined in campaign-monitor
#		- (400 Bad request)           % illegal or banned URI
#
#	header: /gdc/projects/<project>/clientexport/<task-id>[?download=true]
#	GET - *
#		- (200 Ok)              % generated document, if download flag is true, respose contains Content-Disposition header
#		- (202 Accepted) <AsyncTask>  % export still in progress


###############################################################################
# Group: Data Structures
#
# 	header - ClientExportReq
#
#	(start code)
#	ClientExportReq = < clientExport: {
#		url: STRING,	 % url to export
#		name: STRING 	 % output file name
#	}>
#	(end)
#

###############################################################################
# Group: Mock-up
#
#
#   header: Request dashboard export.
#   (start example)
#	POST /gdc/projects/<project>/clientexport
#	BODY:{"clientExport":{"url": "http://secure.gooddata.com/#s=/gdc/projects/<project>|projectDashboardPage|/gdc/md/<project>/obj/130001697|","name":"Mighty dashboard"}}
#	Response
#	HEAD: 201 Created
#	BODY: { "asyncTask": { "link": { "poll" : "/gdc/projects/<project>/clientexport/06e9f945e6eb19d78b2dd8376d5edf73" }} }
#   (end)
#
#   header: Get task result.
#   (start example)
#   GET /gdc/projects/<project>/clientexport/06e9f945e6eb19d78b2dd8376d5edf73
#   Response
#   HEAD: 200 Ok
#   (end)
