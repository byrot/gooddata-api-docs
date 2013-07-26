# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: obj/<id>/explain2
#

###############################################################################
# Group: Description
#
#      For explain reportDefinition decomposition. Relevant for AQE projects.
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/obj/<id>/explain2[?type=east|oqt|sql|ldm|pdm&type=json|html]
#           /md/(\w+)/obj/(\w+)/explain2
#
#           GET - NULL -> Explain2
#

###############################################################################
# Group: Data Structures
#
#   header: explain2
#
#   (start code)
#   Explain2 = < explain2 : SLDM | SPDM | EAST | OQT | SQL | MSG >
#
#   SLDM = < staticLDM : {
#         ldm : {
#             vertices : [ LDMVertex ],
#             edges : [ LDMEdge ]
#         }
#   }>
#
#   LDMVertex = {
#         id    : INT,
#         facts : [ INT ],
#         type  : STRING
#   }
#
#   LDMEdge = {
#         gt : INT,
#         lt : INT
#   }
#
#   SPDM = < staticPDM : {
#         pdm : {
#             tables : [ PDMTable ],
#             edges  : [ PDMEdge ]
#         }
#   } >
#
#   PDMTable = {
#         id : INT,
#         name : STRING,
#         atdl : INT,
#         weight : FLOAT,
#         columns : [ PDMColumn ]
#   }
#
#   PDMColumn = {
#         id : INT,
#         name : STRING,
#         type : STRING
#   }
#
#   PDMEdge = {
#         paths : [ PDMPath ],
#         lt : INT,
#         gt : INT
#   }
#
#   PDMPath = {
#         tables : [ INT ]
#   }
#
#   EAST = < expandedAST : ASTCollection >
#
#   ASTCollection = {
#         type : STRING,
#         content : [ ASTTerm | ASTCollection ],
#         (value : INT | FLOAT | STRING)?,
#         (position: ASTPosition)?
#   }
#
#   ASTTerm = {
#         type : STRING,
#         value : INT | FLOAT | STRING,
#         (position: ASTPosition)?
#   }
#
#   ASTPosition = {
#         line : INT,
#         column: INT
#   }
#
#   OQT = < optimizedQT : QTRCache | QTReport >
#
#   QTRCache = < rcache : {
#         report : QTReport,
#         id : STRING,
#         (ann : ANY)?, % Annotations
#         dim : [ INT ]
#   } >
#
#   QTReport = < report : {
#         metrics : [ ANY ], % Query tree structure, deep tree
#         id : INT,
#         dim : [ INT ],
#         (ann : ANY)? % Annotations
#   } >
#
#   SQL = < sqlQueries : TEXT >
#
#   MSG = < message : STRING >
#
#   (end)

###############################################################################
# Group: Example
#
#   (start example)
#   GET http://example.com/gdc/md/FoodMartDemo/obj/1024/explain2?type=ldm&type=json
#
#   ---
#   {
#     "staticLDM" : {
#       "vertices" : [
#         { "facts" : [], "type" : "", "id" : "1" },
#         { "facts" : [], "type" : "", "id" : "2" },
#         { "facts" : [], "type" : "", "id" : "3" }
#       ],
#       "edges" : [
#         { "lt" : "1", "gt" : "2" },
#         { "lt" : "2", "gt" : "3" }
#       ]
#     }
#   }
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#	GoodData ROLAP / AQE Team
#	Tomas Jirotka
#
