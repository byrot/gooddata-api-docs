# Copyright (C) 2007-2012, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: obj/<id>/validElements
#

###############################################################################
# Group: Description
#
#      For getting all or valid attribute elements to display form object
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/obj/<id>/validElements?[limit=INT]&[offset=INT]&[order=(asc | desc)]&[filter=STRING]&[prompt=URISTRING]
#
#           POST - <ValidElementsRequest>
#           - (200 Ok) <ValidElements>
#           - (204 No Content )
#           - (303 See Other) <Uri> % Start polling
#
#   header: /md/<project>/obj/<id>/validElements/<params>
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

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Tomas Jirotka
#
