# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: dataResult
#

###############################################################################
# Group: Description
#
# UNDOCUMENTED!
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/dataResult/<id>
#           /md/(\w+)/dataResult/(\w+)
#           ?offset=or,oc;size=sr,sc;display=rows,columns,data
#  
#         GET 
#         - 200 <XTabData>   Result is done, return data.
#         - 202 NULL (Refresh : INT)  % Result has not been done
#         - 204 NULL % Report result is empty
#         - 205 NULL % Execution canceled
#         - 400 NULL % Malformed xtabID
#         - 410 NULL % Not found or gone
#         - 500 NULL % any other error
#         
#         DELETE 
#         - 204 No Content % execution canceled
#         - 412 "Nothing canceled" % nothing to cancel, result is already done or it has been canceled
#
#         - all parameters offset, size and display are optional
#         - offset - default value is 0,0 and or represents number of rows and oc represents number of columns to skip
#         - size - default value is overall_size of report and sr represents number of rows and sc represents number of columns to return from resource
#         - display - default value is all components (rows,columns,data) which is used if display parameter is not presented at all
#                  o  rows    - returns rows headers
#                  o  columns - returns columns headers
#                  o  data    - returns data
#          - if you don't like any write display so when parameters are not presented all components are returned with all report data
#  
#         header: Rules for offset and size
#         
#         (start example)
#             # absolute first row and column
#             my $afr = $offset->{rows};                              # where to start - rows
#             my $afc = $offset->{columns};                           # where to start - columns
#             $afr = 0                 if $afr < 0;                   # if offset is negative then set it to 0
#             $afc = 0                 if $afc < 0;                   # if offset is negative then set it to 0
#             $afr = $overalLastRow    if $afr > $overalLastRow;      # if offset is bigger then report then set it to last row
#             $afc = $overalLastColumn if $afc > $overalLastColumn;   # if offset is bigger then report then set it to last column
#         
#             # absolute last row and column
#             my $alr = $afr + $window->{rows} - 1;                   # where to end - rows
#             my $alc = $afc + $window->{columns} - 1;                # where to end - columns
#             $alr = $afr              if $alr < $afr;                # if end is before beginning then make end equal beginning - rows
#             $alc = $afc              if $alc < $afc;                # if end is before beginning then make end equal beginning - columns
#             $alr = $overalLastRow    if $alr > $overalLastRow;      # if offset+size is bigger then report then set it to last row  
#             $alc = $overalLastColumn if $alc > $overalLastColumn;   # if offset+size is bigger then report then set it to last column 
#         (end)
#
# Group: Data Structures
#
#   header: HeaderItem
#
#   (start code)
#   ItemId = STRING          % Do we need DATETIME here ??
#   (end)
#
#   header: HeaderItem
#
#   (start code)
#   HeaderItem = {
#      id : ItemId,                       % for a metric its id is equal to its order (index) in reportDefinition
#      type : root | normal | metric | total,
#      children : [ HeaderItem ],         % children HeaderItem''s
#      index : { (ItemId : [INT])* },          % order of children - numbers in list are indexes to children array
#      first: INT,                        % cell index of first present children
#      last: INT                          % cell index of last present children
#   }
#   (end)
#
#   header: LookUp
#
#   (start code)
#   LookUp = { (INT : TEXT)* }          % key is element id, value is display form string
#   (end)
#
#   header: Headers
#
#   (start code)
#   Headers = {
#      lookups : [LookUp],                % look up tables for current data in same order as in grid
#      tree : HeaderItem                  % root HeaderItem of tree
#   }
#   Size = { rows: INT, columns: INT }    % number of rows and columns
#   (end)
#
#   header: XTabData
#
#   (start code)
#   XTabData = < xtab_data : {
#      (data : [[ FLOAT | INT | NULL ]])?,       % data ordered by rows
#      (rows : Headers)?,                 % headers of row
#      (columns : Headers)?,              % headers of columns
#      overall_size : Size,               % size of whole table
#      offset: Size,                      % position of left top cell
#      size: Size                         % size of currently sended data
#   }>
#   (end)
#

################################################################################
# Group: Info
#
# About: Owner(s)
#
#   Jan Pradac
#   Miroslav Spousta
#
