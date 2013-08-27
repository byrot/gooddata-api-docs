# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: Obj/<id>/explain
#

###############################################################################
# Group: Description
#
#   __THIS RESOURCE IS DEPRECATED__
#
#      For explain reportDefinition decomposition.
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/obj/<id>/explain[?aqe=SLDM|EAST|QT]
#           /gdc/md/(\w+)/obj/(\w+)/explain
#
#           GET - NULL
#		-> 200 Explain
#

###############################################################################
# Group: Data Structures
#
#   header: explain
#
#   (start code)
#   Explain = AFM | StaticLDM | StaticPDM | ExpandedAST | QueryTree
#
#   StaticLDM = < staticLDM : ANY >
#
#   StaticPDM = < staticPDM : ANY >
#
#   ExpandedAST = < expandedAST : ANY >
#
#   QueryTree = < queryTree : ANY >
#
#   AFM = < explain:
#                {
#                   (afm: TEXT)?,
#                   (error: TEXT)?,
#					(ldmpart: {
#                     predeccessors: [
#                       {
#                         id: URISTRING,
#                         items: [URISTRING],
#                       }
#                     ],
#					  successors: [
#                       {
#                         id: URISTRING,
#                         items: [URISTRING],
#                       }
#                     ],
#                  })?
#               }
#   >
#   (end)

###############################################################################
# Group: Example
#
#   (start example)
#   (end)
#
