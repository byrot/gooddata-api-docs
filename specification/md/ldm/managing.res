# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: ldm-manage
#

###############################################################################
# Group: Description
#
#   __Manage project's logical data model.__
#
#   The logical data model is the core concept of GoodData. It can be managed
#   from this resource using MAQL data definition language (DDL).
#
#   __Related resources:__
#
#   - /gdc/md/<project>/maqlvalidator
#   - /gdc/md/<project>/dml
#

###############################################################################
# Group: Resource(s)
#
###############################################################################
# Resource: ldm-manage
#
#	Manage LDM objects with MAQL commands.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/ldm/manage
#
#	POST - Manage
#		-> 200 URIResponses
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since RC22
#
# Topic: Description
#
#	https://confluence.gooddata.com/confluence/display/analysis/MAQL+DDL
#
# Topic: Random Remarks
#
#	- transaction is on the whole request
#
# Topic: Performance mini-status
#
#	{stable-xx, avg/median time}
#
# Topic: Example
#
#	https://confluence.gooddata.com/confluence/display/analysis/MAQL+DDL
#
# Topic: Security Consideration
#
#   header: /gdc/md/<project>/ldm/manage
#     POST - canInitData
#

###############################################################################



##############################################################################
# Resource: ldm-manage2
#
#	Manage LDM objects with MAQL commands. As resource manage but with
#	different response structure.
#
# Topic: Synopsis
#
#	header: /gdc/md/<project>/ldm/manage2
#
#	POST - Manage
#		-> 200 Entries
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since R75
#
# Topic: Description
#
#	https://confluence.gooddata.com/confluence/display/analysis/MAQL+DDL
#
# Topic: Random Remarks
#
#	- transaction is on the whole request
#
# Topic: Performance mini-status
#
#	{stable-xx, avg/median time}
#
# Topic: Example
#
#	POST [maql string with soft synchronize] > { entries => [ { link => ..., category => 'obj' }, { link => ..., category => 'tasks-status' } ] }
#
# Topic: Security Consideration
#
#   header: /gdc/md/<project>/ldm/manage2
#     POST - canInitData
#

###############################################################################
###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: Manage
#
#	List of commands
#
# Topic: Specification
#
#   (start code)
#	Manage = < manage : {
#	  maql: STRING[1,250000]
#	} >
#   (end)
#
# Topic: Description
#
#	Syntax of string is described in https://confluence.gooddata.com/confluence/display/analysis/MAQL+DDL
#

###############################################################################
# Group: Mock-up
###############################################################################
#
#	Manage = < manage : {
#	  maql: 'ALTER ATTRIBUTE {a} ADD KEYS {table.column1} PRIMARY, {table1.column2}, {table2.column3};
#		CREATE ATTRIBUTE {attr.opportunity.category} AS {tab_cat.col_id} FULLSET;'
#	} >
#   (start example)
#	POST /gdc/md/<project>/ldm/manage2
#	BODY: {"manage":{"maql":"ALTER ATTRIBUTE {a} ADD KEYS {table.column1} PRIMARY, {table1.column2}, {table2.column3}; CREATE ATTRIBUTE {attr.opportunity.category} AS {tab_cat.col_id} FULLSET; SYNCHRONIZE DATASET {d} PRESERVE DATA;"}}
#	Response
#	HEAD: 200
#	BODY: {"entries":[{"link":"/gdc/md/<project>/tasks/43dfbcd/status","category":"tasks-status"}]}
#   (end)
#

################################################################################
# Group: Info
################################################################################
#
# About: Owner(s)
#
#	Jiri Schmid
#
