# Copyright (C) 2007-2012, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: validElements
#

###############################################################################
# Group: Description
#
#   __Resource to get attribute elements (values).__
#
#   Attribute elements may be restricted to valid elements relevant to some
#   report definition. Mandatory user filters are always applied.
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/obj/<id>/validElements
#           /gdc/md/<project>/obj/<id>/validElements?[limit=INT]&[offset=INT]&[order=(asc|desc)]&[filter=STRING]&[prompt=URISTRING]
#
#           POST - <ValidElementsRequest>
#           - (200 Ok) <ValidElements>
#           - (204 No Content )
#           - (303 See Other) <Uri> % Start polling
#
#           GET
#           - (200 Ok) <ValidElements>
#           - (202 Accept) <Uri>
#           - (204 No Content )
#           - (400 Bad Request) % handle invalid result
#           - (410 Gone) % Request has been cancelled
#           - (413 Request Entity Too Large) % too large result
#

###############################################################################
# Group: Data Structures
#
#   header: ValidElementsRequest
#
#   (start code)
#   ValidElementsRequest = <
#           validElementsRequest : {
#                 (uris   : [ URISTRING ])?,
#                 (restrictiveDefinition: URISTRING)?
#           }
#   >
#   (end)
#
#   header: ValidElements
#
#   (start code)
#   ValidElements = < validElements:
#                {
#                   items: [ { 
#                     element: { 
#                          uri: URISTRING,  % eg. /gdc/md/FoodMartDemo/obj/71/elements?id=7
#                          title: TEXT
#                        }
#                     }
#                   ],
#                   paging: {
#                        total                : INT,       % total amount of existing elements for a given attributeDisplayForm
#                        count                : INT,       % amount of returned elements
#                        offset               : INT,       % offset of first item, starts from 0
#                   },
#                   elementsMeta : {
#                        attribute            : URISTRING, % attribute URI
#                        attributeDisplayForm : URISTRING, % attributeDisplayForm URI
#                        order                : asc | desc | unsorted,     % amount of required elements
#                        filter               : STRING,    % we search only for substring of filter ie *filter*
#                   }
#                }
#   >
#   (end)

###############################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/obj/123/validElements
#	BODY: {"validElementsRequest":{"restrictiveDefinition":"/gdc/md/<project>/obj/654"}}
#	Response
#	HEAD: 303
#   (end)

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Tomas Jirotka
#
