# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: labels
#
#   Translating element labels to uris

###############################################################################
# Topic: Description
#
#  Resource and structures provided and requested on resource for translating 
#  element labels or element label patters (for provided label/attribute 
#  display form) to element labels uris.

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource
#
#   Labels.
#
# Topic: Synopsis
#
#> /md/<project>/labels
#
#   (start example)
#   GET *
#     -> About
#
#   POST ElementLabelToUri
#     -> ElementLabelUri
#     -> (400 Bad request) ErrorStruct
#
#   (end)
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
# Section: Data Structures
###############################################################################

###############################################################################
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
# Section: Example
###############################################################################
#
#   (start example)
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
