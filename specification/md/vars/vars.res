# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: vars
#

###############################################################################
# Group: Description
#
#   __Resource for project variable maintenance.__
#
#   Variables are objects that can be used to store numbers or specific
#   attribute elements (values). The selection may be customized per user.
#
#   __Related resources:__
#
#   - /gdc/md/<project>/obj
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/variables
#  
#     GET - *
#	-> 200 <About>
#
#   header: /gdc/md/<project>/variables/item
#  
#     GET - *
#	-> 200 <About>
#     POST Variable
#	-> 200 URIResponse
#
#   header: /gdc/md/<project>/variables/item/<id>
#  
#     GET - *
#	-> 200 <About>
#     POST Variable
#	-> 200 URIResponse	% update prompt answer / variable
#     DELETE
#	-> 204 No Content % remove prompt answer / variable
#
#   header: /gdc/md/<project>/variables/user
#  
#     GET - *
#	-> 200 <About>
#     POST Variables
#	-> 200 URIResponse % level = user
#
#   header: /gdc/md/<project>/variables/project
#  
#     GET - 
#	-> 200 <About>
#     POST Variables
#	-> 200 URIResponse % level = project
#
#   header: /gdc/md/<project>/variables/object
#  
#     GET - *
#	-> 200 <About>
#     POST Variables
#	-> 200 URIResponse % level = object
#
#   header: /gdc/md/<project>/variables/search
#  
#     GET - *
#	-> <About>
#     POST VariablesSearch
#	-> 200 Variables
#

###############################################################################
# Group: Security Consideration
#
#   header: /gdc/md/<project>/variables/user
#     POST - canSetUserVariables
#
#   header: /gdc/md/<project>/variables/project
#     POST - canSetProjectVariables
#
#   header: /gdc/md/<project>/variables/item
#     POST - class type
#     env.user - canSetUserVariables
#     env.project - canSetProjectVariables
#
#   header: /gdc/md/<project>/variables/item/<id>
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
# Group: Mock-up
#
#   (start example)
#	POST /gdc/md/<project>/variables/item
#	BODY: {"variable":{"expression":"[/gdc/md/<project>/obj/951] IN ([/gdc/md/<project>/obj/951/elements?id=3])","level":"project","type":"filter","prompt":"/gdc/md/<project>/obj/3688","related":"/gdc/projects/<project>"}}
#	Response
#	HEAD: 200
#   (end)
#
#   (start example)
#	POST /gdc/md/<project>/variables/user
#	BODY: {"variables":[{"expression":"[/gdc/md/<project>/obj/951] IN ([/gdc/md/<project>/obj/951/elements?id=9])","level":"user","related":"/gdc/account/profile/dfc4815","type":"filter","prompt":"/gdc/md/<project>/obj/3688"}]}
#	Response
#	HEAD: 200
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#   Jiri Schmid
#
