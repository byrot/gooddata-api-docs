# Copyright (C) 2007-2012, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: metadata services
#


###############################################################################
# Topic: Description
#
#  Set of resources that provides information about metadata and allows
#  to set various parameters to modify how metadata server acts and works.


###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: service
#
#	Access point for metadata related services and informations
#
# Topic: Synopsis
#
#> /gdc/md/< project >/service
#
#   (start example)
#	GET *
#	  -> (200 OK) <About>
#    (end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - since R79
#
# Topic: Description
#
#	Access this resource whenever you need to find out what services
#	and informatoin can be retrieved about metadata and related systems.
#
# Topic: Example
#
#	GET, receive About.
#

###############################################################################
# Resource: service-engine
#
#	Provide information about effective query engine, by posting
#	an alternative one can be turned on.
#
# Topic: Synopsis
#
#> /gdc/md/< project >/service/engine
#
#   (start example)
#	GET *
#	  -> (200 OK) <QueryEngine>
#       PUT <QueryEngine>
#	  -> (200 OK) <QueryEngine>
#	  -> (400 BadRequest)
#	  -> (403 Forbidden)
#       POST <QueryEngine>
#	  -> (200 OK) <QueryEngine>
#	  -> (400 BadRequest)
#	  -> (403 Forbidden)
#   (end)
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - since R79
#
# Topic: Description
#
#	Access this resources whenever you need to find out what query engine
#	is effective. Post new values when another engine to run is required.
#	Resource should fail with 403 when engine is not compatible with DWH
#	and with 400 when engine was not recognized.
#
# Topic: Security Consideration
#
#   header: /md/<project>/service/engine
#     POST - canMaintainProject
#

###############################################################################
# Section: Data Structures
###############################################################################

###############################################################################
# Structure: QueryEngine
#
#	Structure describing effective query engine.
#
# Topic: Specification
#
#   (start code)
#   QueryEngine = < service : {
#      queryEngine : 'AQE' | 'QT'
#   } >
#   (end)
#

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	Jiri Schmid
#
