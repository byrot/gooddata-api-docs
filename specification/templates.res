# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: templates

###############################################################################
# Group: Description
#
#   Project templating resource.
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/templates
#           
#           
#    GET  - *
#	-> (200 Ok) TemplateList
#			Return list of sub-categories and templates in current level.
#  

###############################################################################
# Group: Data Structures
#
#   header: TemplateList
#
#   (start code)
#
#	Category = < category : {
#   	name : STRING,
#   	uri : URISTRING
#	}>
#
#	TemplateEntry = < templateEntry : {
#   	name : STRING,
#   	uri : URISTRING
#	}>
#
#   TemplateList = < templateList: [ Category | TemplateEntry ] >
#   (end)
#
#   header: Template
#
#   (start code)
#   Template = < template: {
#		text : STRING
#	}>
#   (end)
#

###############################################################################
# Group: Mock-up
#
#   header: get templates on /gdc/templates resource
#   (start example)
#	GET /gdc/templates
#	Response
#	HEAD: 200 OK
#	BODY: {"templateList":{"categories":[{"emails":"/gdc/templates/emails"}],"templates":[]}}
#   (end)
#
#   header: get template
#   (start example)
#	GET /gdc/templates/emails/invitations/default
#	Response
#	HEAD: 200 OK
#	BODY: {"template":{"text":"Hello!\n{firstname} {lastname} ({email}) is inviting you to join the project \"{projecttitle}\" hosted by GoodData, a new online service designed for people\nwho are passionate about performing data-driven analysis and delivering answers\nto real business problems.\n\nMessage from: {firstname} {lastname}\n{message}\n"}}
#   (end)
#


################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jiri Zaloudek
#
