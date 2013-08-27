# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: maqlvalidator
#

###############################################################################
# Group: Description
#
#   __Resource to parse and validate MAQL queries.__
#
#   MAQL is GoodData multidimensional analytical query language.
#   It allows you to write metrics which can be used in reports.
#
#   __Related resources:__
#
#    - [MAQL Basics](http://developer.gooddata.com/article/metrics-and-maql)
#    - [MAQL Reference Guide](http://developer.gooddata.com/article/advanced-maql-reference-guide)
#    - /gdc/md/<project>/ldm/manage2
#    - /gdc/md/<project>/dml/manage
#    - /gdc/md/<project>/query/metrics
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/maqlvalidator
#
#        POST - <MaqlDef>
#		-> 200 <ValidationResult>
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

###############################################################################
# Group: Mock-up
#
#   header: Create a metric
#   (start example)
#	POST /gdc/md/<project>/maqlvalidator
#	BODY:
#	---
#	expression: CREATE METRIC {m.amount.sum} AS SELECT SUM({f.amount});
#	Response
#	HEAD: 200 Ok
#	BODY:
#	--- 
#	maqlOK: 
#	  expression: CREATE METRIC {m.amount.sum} AS SELECT SUM({f.amount});
#	  trees: 
#	    - 
#	      content: 
#	        - 
#	          content: 
#	            - 
#	              position: 
#	                column: 15
#	                line: 1
#	              type: identifier
#	              value: m.amount.sum
#	            - 
#	              content: 
#	                - 
#	                  content: 
#	                    - 
#	                      content: 
#	                        - 
#	                          position: 
#	                            column: 44
#	                            line: 1
#	                          type: identifier
#	                          value: f.amount
#	                      position: 
#	                        column: 40
#	                        line: 1
#	                      type: function
#	                      value: SUM
#	                  position: 
#	                    column: 40
#	                    line: 1
#	                  type: expression
#	              position: 
#	                column: 33
#	                line: 1
#	              type: metric
#	          position: 
#	            column: 8
#	            line: 1
#	          type: metric def
#	      position: 
#	        column: 1
#	        line: 1
#	      type: create
#   (end)

################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Hynek Vychodil
#
