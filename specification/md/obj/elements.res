# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: obj/<id>/elements
#

###############################################################################
# Group: Description
#
#
#   Resource providing list of attribute elements.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/obj
#   - /gdc/md/<project>/obj/<id>/validElements
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/obj/<id>/elements
#           /gdc/md/(\w+)/obj/(\w+)/elements
#
#           POST - <ElementsDispFormReq>
#		-> 200 <AttributeElements>
#
#   header: /gdc/md/<project>/obj/<id>/elements?uris=LIST_OF_URIS&[order=asc|desc]
#           LIST_OF_URIS /gdc/md/FoodMartDemo/obj/<AttrID>/elements?id=2006;/gdc/md/FoodMartDemo/obj/<AttrID>/elements?id=2007
#						 DO NOT FORGET to escape URI parameters (uris=/gdc/md/FoodMartDemo/obj/71/elements%3Fid%3D2006;/gdc/md/FoodMartDemo/obj/71/elements%3Fid%3D2007)
#
#           GET - NULL
#		-> 200 <AttributeElements>
#
#   header: /gdc/md/<project>/obj/<id>/elements?id=INT
#
#           GET - NULL
#		-> 200 <AttributeElements>
#
#   /gdc/md/<project>/obj/<AttrId>/elements
#
#         Not implemented yet -  https://bugzilla.gooddata.com/show_bug.cgi?id=1408 

###############################################################################
# Group: Data Structures
#
#   header: ElementsDispFormReq
#
#   (start code)
#   ElementsDispFormReq = <
#           elementsDispFormReq : {
#                 uris    : [ URISTRING ],
#                 (order  : asc | desc)?, 
#                 (count  : INT)?,
#                 (offset : INT)?,
#                 (filter : STRING)?,    % we search only for substring of filter ie *filter*
#                 (prompt : URISTRING)?, % limit output to prompt definition
#                 (mode : 'includeuris'|'excludeuris')?  % exclude specified uris or not
#           }
#   >
#   (end)
#
#   header: AttributeElements
#
#   (start code)
#   AttributeElements = < attributeElements:
#                {
#                   elements: [
#                        { uri: URISTRING,  % eg. /gdc/md/FoodMartDemo/obj/71/elements?id=7
#                          title: TEXT
#                        }
#                   ],
#                   elementsMeta : {
#                        attribute            : URISTRING, % attribute URI
#                        attributeDisplayForm : URISTRING, % attributeDisplayForm URI
#                        records              : INT,       % total amount of existing elements for a given attributeDisplayForm
#                        count                : INT,       % amount of returned elements
#                        offset               : INT,       % offset of first item, starts from 0
#                        order                : asc | desc | unsorted,     % amount of required elements
#                        filter               : STRING,    % searched string
#                        mode                 : 'includeuris'|'excludeuris', % results mode
#                        prompt               : URISTRING|'' % result is limited to user prompt answer
#                   }
#                }
#   >
#   (end)

###############################################################################
# Group: Mock-up
#
#   (start example)
#	GET /gdc/md/<project>/obj/139/elements?uris=/gdc/md/<project>/obj/71/elements?id=2006;/gdc/md/<project>/obj/71/elements?id=2007
#	Response
#	HEAD: 200
#	BODY:
#	---
#	attributeElements:
#	  attribute: /gdc/md/FoodMartDemo/obj/71
#	  attributeDisplayForm: /gdc/md/FoodMartDemo/obj/139
#	  elements:
#	    -
#	      title: 2006
#	      uri: /gdc/md/FoodMartDemo/obj/71/elements?id=2006
#	    -
#	      title: 2007
#	      uri: /gdc/md/FoodMartDemo/obj/71/elements?id=2007
#   (end)
#   71 is attribute, 139 is attribute display form of this attribute.

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Martin Cacky, Vladimir Makovsky
#
