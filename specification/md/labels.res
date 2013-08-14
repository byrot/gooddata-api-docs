# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: labels
#

###############################################################################
# Group: Description
#
#  __Resource to translate textual labels of attribute elements to their URI.__
#  
#  Every attribute has at least one label which is textual content of the
#  attrubute. To use the elements (attribute values) in MAQL you need the URI.
#
#  __Related resources:__
#
#  - /gdc/md/<project>/obj/<id>/validElements
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/labels
#
#      GET - *
#        -> About
#   
#      POST - ElementLabelToUri
#        -> ElementLabelUri
#        -> (400 Bad request) ErrorStruct
#
#
# Topic: Flags
#
#   See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since gs55
#
###############################################################################
# Group: Data Structures
#
#
# Structure: ElementLabelToUri
#
#   List of label uris and element labels to translate.
#
# Topic: Specification
#
#   (start code)
#   ElementLabelToUri = < elementLabelToUri : [
#    {
#      labelUri : URISTRING,   % uri of the label (attribute display form)
#      mode: 'EXACT',          % match mode, only 'EXACT' supported
#      patterns : [ STRING ]   % element labels (in EXACT mode) or patterns to match them
#    }
#   ] >
#   (end)
#
# Structure: ElementLabelUri
#
#   Result structure with list of element labels and theirs uris. Each element in 'patterns' 
#   array of input structure (ElementLabelToUri) has correspondig element (on the same position 
#   in array) in 'result' array of output structure (ElementLabelToUri). See structures example.
#
# Topic: Specification
#
#   (start code)
#   ElementLabelUri = < elementLabelUri : [
#     {
#       labelUri : URISTRING,    % uri of the label (attribute display form)
#       mode: 'EXACT',           % match mode
#       result: [
#         {
#           pattern: STRING,     % patter (or element label in EXACT mode)
#           elementLabels : [ 
#             {
#               elementLabel : STRING,   % element label (string)
#               uri : URISTRING,         % element label uri
#             }
#           ]
#         }
#       ]
#     }
#   ] >
#   (end)

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/labels
#	BODY: {"elementLabelToUri":[{"labelUri":"/gdc/md/<project>/obj/456","mode":"EXACT","patterns":["Jun","Jul"]}]}
#	Response
#	HEAD: 200
#	BODY: {"elementLabelUri":[{"mode":"EXACT","labelUri":"/gdc/md/<project>/obj/952","result":[{"pattern":"Jun","elementLabels":[{"elementLabel":"Jun","uri":"/gdc/md/<project>/obj/951/elements?id=6"}]},{"pattern":"Jul","elementLabels":[{"elementLabel":"Jul","uri":"/gdc/md/<project>/obj/951/elements?id=7"}]}]}]}
#   (end)
#
#
#
#   ElementLabelToUri = < elementLabelToUri : [
#     {
#       labelUri : '/gdc/md/FoodMartDemo/obj/1200039',  % label_opp_close_month_of_year_short
#       mode: 'EXACT',
#       patterns : [ 'Jun', 'not_existing', 'Nov', 'Nov', 'Jul' ]
#     }, {
#       labelUri : '/gdc/md/FoodMartDemo/obj/1300022',  % label_opp_snapshot_day_of_week_long
#       mode: 'WILD', % to allow wildcard characters (not supported yet)
#       patterns : [ 'S*' ]
#     } 
#   ] >
#
#
#   ElementLabelUri = < elementLabelUri : [
#     {
#       labelUri : '/gdc/md/FoodMartDemo/obj/1200039',   % label_opp_close_month_of_year_short
#       mode: 'EXACT',
#       result: [
#         { 
#           pattern : 'Jun',
#           elementLabels : [
#             {
#               elementLabel : 'Jun',
#               uri : '/gdc/md/FoodMartDemo/obj/1200016/elements?id=6'   % attr_opp_close_month_of_year, id 6
#             }
#           ],
#         }, {
#           pattern : 'not_existing',
#           elementLabels : []
#         }, {
#           pattern : 'Nov',
#           elementLabels : [
#             {
#               elementLabel : 'Nov',
#               uri : '/gdc/md/FoodMartDemo/obj/1200016/elements?id=11'  % attr_opp_close_month_of_year, id 11
#             }
#           ]
#         }, {
#           pattern : 'Nov',
#           elementLabels : [
#             {
#               elementLabel : 'Nov',
#               uri : '/gdc/md/FoodMartDemo/obj/1200016/elements?id=11'  % attr_opp_close_month_of_year, id 11
#             }
#           ]
#         }, {
#           pattern : 'Jul',
#           elementLabels : [
#             {
#               elementLabel : 'Jul',
#               uri : '/gdc/md/FoodMartDemo/obj/1200016/elements?id=7'   % attr_opp_close_month_of_year, id 7
#             }
#           ]
#         }
#       ]
#     }, 
#     {
#       labelUri : '/gdc/md/FoodMartDemo/obj/1300022',   % label_opp_snapshot_day_of_week_long
#       mode: 'WILD',
#       result: [
#         { 
#           pattern : 'S*',
#           elementLabels : [
#             {
#               elementLabel : 'Sunday',
#               uri : '/gdc/md/FoodMartDemo/obj/130004/elements?id=7'  % attr_opp_snapshot_day_of_week, id 7
#             }, {
#               elementLabel : 'Saturday',
#               uri : '/gdc/md/FoodMartDemo/obj/130004/elements?id=6'  % attr_opp_snapshot_day_of_week, id 6
#             }
#           ]
#         }
#       ]
#     }
#   ] >
#   (end)



################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#   Michal Jurosz
#
