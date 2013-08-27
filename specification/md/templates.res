# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: templates
#

###############################################################################
# Group: Description
#
#  __Resource returning dependency information about objects.__
#
#  All resources in this documentation return persistent objects only.
#

###############################################################################
# Group: Resource(s)
###############################################################################

###############################################################################
# Resource: templates
#
# resource adding template into an existing project
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/templates
#
#	parameters:
#		none
#
#   (start example)
#	POST - URI
#		-> 200 URI
#	GET - *
#		-> 200 TemplatesInfo
#	(end)
#
#   (start code)
#	TemplatesInfo = < templatesInfo : TemplatesInfoType
#	>
#
#   TemplatesInfoType = [
#			{ version : STRING,
#			  url : URISTRING | NULL,
#			  urn: STRING,
#			  (connectorId: STRING)?,
#			  (createIntegration: STRING)?
#			 }]
#	(end)
#
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - draft
#
# Topic: Description
#
#    You post URI with project template meta on this resource. Unfotunatelly you cannot query error message
#    if the template load fails.
#
# Topic: Random Remarks
#
# Topic: Performance mini-status
#
#	{stable-xx, avg/median time}
#
# Topic: Example
#

###############################################################################
# Group: Mock-up
################################################################################
#
#	(start example)
#	POST /gdc/md/<project>/templates
#	BODY: { "uri" : "/projectTemplates/ZendeskAnalytics/2/index.json" }
#	Response
#	HEAD: 200
#	BODY: { "uri" : "/gdc/md/Project2/etltask/aar51dMVceSf" }
#	(end)

################################################################################
# Group: Info
################################################################################
#
# About: Owner(s)
#
#	{Owner Name or names separated by comma, persons which are responsible for
#	completness and correctenes	of this docummentation.}
#
# About: Revision
#
#
# About: Copyright
#
#   *Copyright (C) 2007, GoodData Corporation* All rights reserved.
#
#   This program is not a free software. Let contact GoodData Corporation
#   (www.gooddata.com) in case to be informed about licensing conditions
#   for usage, modifications or distribution.
#
#   You may not (and you may not permit anyone else to) distribute, copy, modify,
#   create a derivative work of, reverse engineer, decompile or otherwise attempt
#   to extract the source code of this program or any part thereof, unless you have
#   been specifically allowed do so by GoodData Corporation in writing, or unless
#   this is expressly permitted or required by law.
#
#   GoodData Corporation *EXPRESSLY DISCLAIMS ALL WARRANTIES* and conditions
#   of any kind, whether express or implied, including, but not limited to
#   the implied warranties and all conditions of merchantability, fitness for
#   a particular purpose and non-infringement.
#
#   GoodData Corporation *SHALL NOT BE LIABLE* to you for any direct, indirect,
#   incidental, special consequential or exemplary damages which may be incurred
#	by you under any theory of liability. This shall include, but not be limited to,
#	any loss of profit (whether incurred directly or indirectly) or business
#	reputation, any loss of data suffered or other intangible loss;
