# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: maqlvalidator
#

###############################################################################
# Group: Description
#
#       Parse and valiadte MAQL.
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/maqlvalidator
#       /md/(\w+)/maqlvalidator
#
#        POST - <MaqlDef> -> <ValidationResult>
#  

###############################################################################
# Group: Data Structures
#
#   header: MaqlDef
#
#   (start code)
#   MaqlDef = { expression : STRING[1,100000] }
#   (end)
#
#   header: ValidMAQL
#
#   (start code)
#    ValidMAQL = < maqlOK: {
#    	expression : STRING[1,100000],         % Original parsed string
#    	trees      : [MAQLTree],          % Maql Tree Definition
#    } >
#   (end)
#
#   header: ParserError
#
#   (start code)
#	 ParserError = < parserError: {
#    		got      : {
#    			token : STRING,  % Token name
#    			value : STRING   % Token value
#    		},
#    		expected : [STRING], % Expected token names
#    		position : {         % Position in input string 
#    			line   : INT,
#    			column : INT
#    		}
#    	}>
#   (end)
#
#   header: NotFound
#
#   (start code)
#	 NotFound = < objectNotFound: {
#	 		uri: STRING,         % given uri of object which not found
#    		position : {         % Position in input string 
#    			line   : INT,
#    			column : INT
#    		}
#    	}>
#   (end)
#
#   header: MAQLError
#
#   (start code)
#	 MAQLError = ParserError | NotFound
#   (end)
#
#   header: ValidatorError
#
#   (start code)
#    ValidatorError= < maqlError : {
#    	expression : STRING[1,100000],         % Original parsed string
#    	trees      : [ MAQLTree | NULL ],        % Parsed trees
#    	errors     : [MAQLError]
#    }>
#   (end)
#
#   header: ValidationResult
#
#   (start code)
#   ValidationResult = ValidMAQL | ValidatorError
#   (end)
#
#
################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Hynek Vychodil
#
