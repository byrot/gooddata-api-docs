# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: Query Resources
#

###############################################################################
# Group: Description
#
#   __Resources to get list of metadata objects of certain type.__
#
#   Metadata objects are for example attributes, facts, metrics, reports,
#   report definitions, dashboards, etc.
#
#   __Related resources:__
#
#   - /gdc/md/<project>
#   - /gdc/md/<project>/obj
#   - /gdc/md/<project>/reportdefinition
#

###############################################################################
# Group: Resource(s)
#
#
# Resource: query
#
#	Returns list of obejcts of all types.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/query
#
#	parameters:
#
#		author=URISTRING - constrain resulting list to objects cerated by given
#			user. Parameter is optional and works only in GET method.
#
#	GET - *
#		-> 200 Query
#
#	POST - Req
#		-> 200 Query
#
#	See <Query> and <Req> for details about used data sructures.
#
#	header: /gdc/md/<project>/query/<type>
#
#	GET - *
#		-> 200 Query
#
#
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since CS1
#
# Topic: Description
#
#	It returns list of all objects in current project. Resulting list cen be
#	filtered to object which was created by certain user.
#
# Topic: Random Remarks
#
#	You should assume this resource as slow because there can be a lot of
#	objects even in ordinary project. This resource is used very rare in
#	production.
#
# Topic: Performance mini-status
#
#	stable-14 - avg 94.4ms / median 95.56ms (statistically unimportant beacause
#		too much low amount of requests)
#

###############################################################################
# Group: Mock-up
#
#   (start example)
#	GET /gdc/md/<project>/query/attributes
#	Response
#	HEAD: 200
#	BODY: {   "query" : {
#				"entries" : [
#				{   "link" : "/gdc/md/30zl394d0ntp3d2ks1aw3lzhaois9x17/obj/127",
#					"author" : {
#						"name" : "Jara Cimrman",
#						"uri"  : "/gdc/account/profile/72"
#					},
#					"tags"        : "",
#					"created"     : "2009-10-07 19:27:39",
#					"deprecated"  : "0",
#					"summary"     : "",
#					"title"       : "Resource",
#					"category"    : "attribute",
#					"updated"     : "2009-10-07 19:27:40",
#					"contributor" : {
#						"name" : "Jara Cimrman",
#						"uri"  : "/gdc/account/profile/72"
#					}
#				},
#				{   "link" : "/gdc/md/30zl394d0ntp3d2ks1aw3lzhaois9x17/obj/118",
#					"author" : {
#						"name" : "Jara Cimrman",
#						"uri"  : "/gdc/account/profile/72"
#					},
#					"tags"        : "",
#					"created"     : "2009-10-07 19:27:45",
#					"deprecated"  : "0",
#					"summary"     : "",
#					"category"    : "attribute",
#					"title"       : "Name",
#					"updated"     : "2009-11-01 13:09:11",
#					"contributor" : {
#						"name" : "Jara Cimrman",
#						"uri"  : "/gdc/account/profile/72"
#					}
#				}
#			],
#			"meta" : {
#				"summary" :
#					"Metadata Query Resources for project '30zl394d0ntp3d2ks1aw3lzhaois9x17'",
#				"title"    : "List of allTypes",
#				"category" : "MD::Query::Object"
#			}
#		}
#	}
#	(end)
#

###############################################################################
# Resource: query_type
#
#	Returns list of obejcts of requested type.
#
# Topic: Synopsis
#
#>	/gdc/md/<project>/query/<type>
#>	/gdc/md/<project>/query/notes/<type>
#
#	Where types are:
#		reports - report
#		reportdefinition - reportDefinition
#		facts - fact
#		attributes - attribute
#		filtres - filter
#		folders - folder
#		metrics - metric
#		dimensions - dimension
#		domains - domain
#		etlfiles - etlFile
#		tables - table
#		columns - column
#		tabledataloads - tableDataLoad
#		etlinterfaces - etlInterface
#		projectdashboards - projectDashboard
#		datasets - dataSet
#		prompts - prompt
#		scheduledmails - scheduledmail
#
#		and others which are not translated and used as is.
#
##	parameters:
#
#		author=URISTRING - constrain resulting list to objects cerated by given
#			user. Parameter is optional and works only in GET method.
#
#   (start example)
#	GET *
#		-> OK Query
#
#	POST Req
#		-> OK Query
#	(end)
#
#	See <Query> and <Req> for details about used data sructures.
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since CS1
#
# Topic: Description
#
#	It returns list of all objects of given type in current project. Resulting
#	list cen be	filtered to object which was created by certain user.
#
# Topic: Random Remarks
#
#
# Topic: Performance mini-status
#
#	stable-17:
#	folders - avg 142ms, median 135ms
#	attributes - avg 158ms, median 151ms
#	datasets - avg 128ms, median 118ms
#	dimensions - avg 127ms, median 114ms
#	etlinterfaces - avg 137ms, median 133ms
#	reports - avg 170ms, median 160ms
#	metrics - avg 163ms, median 153ms
#	projectdashboards - avg 108ms, median 103ms
#	domains - avg 132ms, median 112ms
#	prompts - avg 129ms, median 124ms
#	facts - avg 121ms, median 109ms
#	notes/comment - avg 110ms, median 76ms
#	scheduledmails - avg 122ms, median 96ms
#
# Topic: Example
#
#	Get all attributes created by user /gdc/account/profile/72.
#
#	(start example)
#	GET (?author=/gdc/account/profile/72) * # on resource query/attributes
#	-> OK {   "query" : {
#			"entries" : [
#				{   "link" : "/gdc/md/30zl394d0ntp3d2ks1aw3lzhaois9x17/obj/109",
#					"author" : {
#						"name" : "Hynek Vychodil",
#						"uri"  : "/gdc/account/profile/72"
#					},
#					"tags"        : "",
#					"created"     : "2009-10-07 19:27:39",
#					"deprecated"  : "0",
#					"summary"     : "",
#					"title"       : "Request ID",
#					"category"    : "attribute",
#					"updated"     : "2009-10-07 19:27:40",
#					"contributor" : {
#						"name" : "Hynek Vychodil",
#						"uri"  : "/gdc/account/profile/72"
#					}
#				},
#				{   "link" : "/gdc/md/30zl394d0ntp3d2ks1aw3lzhaois9x17/obj/127",
#					"author" : {
#						"name" : "Hynek Vychodil",
#						"uri"  : "/gdc/account/profile/72"
#					},
#					"tags"        : "",
#					"created"     : "2009-10-07 19:27:39",
#					"deprecated"  : "0",
#					"summary"     : "",
#					"category"    : "attribute",
#					"title"       : "Resource",
#					"updated"     : "2009-10-07 19:27:40",
#					"contributor" : {
#						"name" : "Hynek Vychodil",
#						"uri"  : "/gdc/account/profile/72"
#					}
#				},
#				{   "link" : "/gdc/md/30zl394d0ntp3d2ks1aw3lzhaois9x17/obj/103",
#					"author" : {
#						"name" : "Hynek Vychodil",
#						"uri"  : "/gdc/account/profile/72"
#					},
#					"tags"        : "",
#					"created"     : "2009-10-07 19:27:39",
#					"deprecated"  : "0",
#					"summary"     : "",
#					"category"    : "attribute",
#					"title"       : "Time5Quantil",
#					"updated"     : "2009-10-07 19:27:40",
#					"contributor" : {
#						"name" : "Hynek Vychodil",
#						"uri"  : "/gdc/account/profile/72"
#					}
#				},
#				...
#			],
#			"meta" : {
#				"summary" :
#					"Metadata Query Resources for project '30zl394d0ntp3d2ks1aw3lzhaois9x17'",
#				"title"    : "List of attributes",
#				"category" : "MD::Query::Object"
#			}
#		}
#	}
#	(end)
#

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: Query
#
#	Result of query resource.
#
# Topic: Specification
#
#   (start code)
#   Query = < query: {
#		entries : [LINK],
#		meta: {
#			summary: STRING,
#			title: STRING,
#			category: STRING
#		}} >
#   (end)
#
# Topic: Description
#
#	Query result.
#

###############################################################################
# Structure: Req
#
#	Structutre of request to query resource.
#
# Topic: Specification
#
#   (start code)
#   Req = < req: {
#		( author : URISTRING )?,	% constrain to object creted by this user
#		( param : [Params] )?
#	} >
#
#   Params = title | category | summary | author | created | contributor | updated
#   (end)
#
# Topic: Description
#
#	Query request. 'param' field defines which object metadata must be returned in
#	<Query> result.
#

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	Vašek Dovrtěl, Hynek Vychodil
#
