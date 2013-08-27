# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: availableelements
#

###############################################################################
# Group: Description
#
#	**THIS RESOURCE IS DEPRECATED**
#
#       This resource is intended to return a list of elements for specified
#       reportDefinition and attributeDisplayForm. Each element is presented as
#       array of an element ID and a related display form. Elements are sorted
#       by IDs.

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/availableelements
#       POST -  <AvailableElementsRequest>
#		-> 201 (Location: URISTRING)   % created result uri
#       GET  -  *
#		-> <About>
#  
#   header: /gdc/availableelements/(\w+)
#       DELETE
#		-> 204 NULL % execution canceled
#
#   header: /gdc/availableelements/(\w+)?attribute=URISTRING(&count=INT(&offset=INT)?)?   % results uri
#       GET - *
#		-> 200 <AvailableElements>
#       GET - *
#		-> 202 Refresh    % accepted and still processing task
#       GET - *
#		-> 204  % no content
#       GET - *
#		-> 410  % execution gone (other user cancelled execution)

###############################################################################
# Group: Security Consideration
#
#   header: /availableelements
#       POST - project membership
#  
#   header: /availableelements/(\w+)?attribute=URISTRING(&count=INT(&offset=INT)?)?   % results uri
#       GET - project membership

###############################################################################
# Group: Data Structures
#
#   header: AvailableElementsRequest
#
#   (start code)
#   AvailableElementsRequest = < availableElementsRequest : { report : URISTRING } >
#   (end)
#
#
#   header: AvailableElements
#
#   (start code)
#   AvailableElements = < availableElements : { 
#                             elementsMeta : { 
#                                 records   : INT,       % total amount of available records
#                                 count     : INT,       % amount of required elements
#                                 offset    : INT,       % offset of first item
#                                 attribute : URISTRING, % attributedisplayform ...
#                                 report    : URISTRING
#                             },
#                             elementsList : Links       % only keys 'link' and 'title' are returned
#                       }>
#   (end)

###############################################################################
# Group: Usage
#     
#     One can post a report definition object URI to */availableelements*
#     resource, then will obtain URI of cached result. Consequently is
#     possible to GET list of elements from such result URI (optionally is
#     possible to specify offset and maximum count of returned elements as
#     result URI parameters).

################################################################################
# Group: Info
#
# About: Owner(s)
#
#    Jiri Schmidt
#
