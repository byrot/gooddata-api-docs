# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: vars
#

###############################################################################
# Group: Description
#
#   Structures provided and requested on resource for mapping datasets/attrs.
#
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/variables
#  
#     GET - -> <About>

#   header: /md/<project>/variables/item
#  
#     GET - -> <About>
#     POST Variable > URIResponse, 200 OK

#   header: /md/<project>/variables/item/< id >
#  
#     GET - -> <About>
#     POST Variable > URIResponse, 200 OK	% update prompt answer / variable
#     DELETE > 204 No Content % remove prompt answer / variable

#   header: /md/<project>/variables/user
#  
#     GET - -> <About>
#     POST Variables -> URIResponse, 200 OK % level = user

#   header: /md/<project>/variables/project
#  
#     GET - -> <About>
#     POST Variables -> URIResponse, 200 OK % level = project

#   header: /md/<project>/variables/object
#  
#     GET - -> <About>
#     POST Variables -> URIResponse, 200 OK % level = object

#   header: /md/<project>/variables/search
#  
#     GET - -> <About>
#     POST VariablesSearch > 200 OK, Variables

###############################################################################
# Group: Security Consideration
#
#   header: /md/<project>/variables/user
#     POST - canSetUserVariables
#
#   header: /md/<project>/variables/project
#     POST - canSetProjectVariables
#
#   header: /md/<project>/variables/item
#     POST - class type
#     env.user - canSetUserVariables
#     env.project - canSetProjectVariables
#
#   header: /md/<project>/variables/item/<id>
#     POST, DELETE - class type
#     env.user - canSetUserVariables
#     env.project - canSetProjectVariables
#
###############################################################################
# Group: Data Structures
#
#   header: VariableContent
#
#   (start code)
#
#	VariableContent = {
#	   expression: STRING[1,100000], %maql expression
#	   prompt : URISTRING,          %prompt's uri
#	   related: URISTRING,          %user | project | object uri 
#	   (tree: MAQLTree)?,           %maql tree
#	   (objects: [LINK|ElementLink])?,  %maql objects
#	   (uri: URISTRING)?,           %it selves uri
#	   level : 'user'|'project'|'object',
#	   type: 'filter'|'scalar'
#	}
#
#   (end)
#
#   header: Variable
#
#   (start code)
#
#	Variable = < variable : VariableContent >
#
#   (end)
#
#   header: Variables
#
#   (start code)
#
#	Variables = < variables : [ VariableContent ] >
#
#   (end)
#
#   header: VariablesSearch
#
#   (start code)
#
#	VariablesSearch = < variablesSearch : {
#	   variables : [ URISTRING ],	% empty list means no restriction on prompt
#	   context : [ URISTRING ] % empty list means no restriction on context
#	}>
#
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#   Jiri Schmid
#
