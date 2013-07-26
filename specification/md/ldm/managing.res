# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: ldm-manage
#

###############################################################################
# Topic: Description
#
#  Structures provided and requested on resource for managing of logical model.
#  A maql posted on resource is parsed and processes after that list of all
#  objects identified within maql except deleted are returned.
#

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: ldm-manage
#
#	Manage LDM objects with MAQL commands.
#
# Topic: Synopsis
#
#	/md/<project>/ldm/manage
#
#   (start example)
#	POST Manage
#		-> URIResponses
#	(end)
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
#   header: /md/<project>/ldm/manage
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
#	/md/<project>/ldm/manage2
#
#   (start example)
#	POST Manage
#		-> Entries
#	(end)
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
#   header: /md/<project>/ldm/manage2
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
# Section: Example
###############################################################################
#
#	Manage = < manage : {
#	  maql: 'ALTER ATTRIBUTE {a} ADD KEYS {table.column1} PRIMARY, {table1.column2}, {table2.column3};
#		CREATE ATTRIBUTE {attr.opportunity.category} AS {tab_cat.col_id} FULLSET;'
#	} >

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	Jiri Schmid
#
