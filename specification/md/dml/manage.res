# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: dml-manage
#
# Data manipulation language managing.

###############################################################################
# Topic: Description
#
#  Structures provided and requested on resource for data manipulation.
#  A maql posted on resource is parsed and processes. It creates an etl 
#  worker task and starts it. Provides uri to status of task.
#

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: dml
#
#	Navigation resource to DML resources.
#
# Topic: Synopsis
#
#>	/md/<project>/dml
#
#   (start example)
#	GET *
#		-> OK About
#	(end)
#

###############################################################################
# Resource: dml-manage
#
#	Manage warehouse data with MAQL DML commands.
#
# Topic: Synopsis
#
#>	/md/<project>/dml/manage
#
#   (start example)
#	GET *
#		-> OK About
#
#	POST Manage
#		-> URI
#		-> (400 Bad request) ErrorStruct
#	(end)
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since Falcon R51
#
# Topic: Description
#
#	https://confluence.gooddata.com/confluence/display/analysis/Delete+data+from+project
#
# Topic: Performance mini-status
#
#	Asynchronous task (immediate response, but long real task running time).
#
# Topic: Example
#
#	https://confluence.gooddata.com/confluence/display/analysis/Delete+data+from+project
#
# Topic: Security Consideration
#
#   header: /md/<project>/dml/manage
#     POST - canInitData
#

###############################################################################
# Section: Example
###############################################################################
#
#	Manage = < manage : {
#	  maql: 'DELETE FROM {attr.factsof} WHERE {label.created.iso} BETWEEN "2010-01-01" AND "2010-12-31";'
#	} >

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	Jiri Schmid, Michal Jurosz, Vladimir Vacula
#
