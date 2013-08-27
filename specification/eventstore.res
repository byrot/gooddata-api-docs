# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
############################################################################################################
#
#  Section: eventstore
#
############################################################################################################
# Group: Description
#
#   __GoodData EventStore maintenance resources__
#
#   It is possible to create or delete an EventStore instance, manage tasks, etc.
#
#   __Related resources:__
#
#   - [Introduction to EventStore](http://developer.gooddata.com/blog/The-Event-Store-Introduction)
#   - [CloudConnect EventStore writer](http://developer.gooddata.com/cloudconnect/manual/es-writer.html)
#   - [CloudConnect EventStore reader](http://developer.gooddata.com/cloudconnect/manual/es-reader.html)
#

############################################################################################################
# Group: Resource(s)
#
# header: /gdc/projects/<project>/eventStore/stores
# 
#   POST - <Store>                              % creates new es store
#   - (201 Created) <URIResponse>             % es store resource created
#   - (400 Bad Request)                       % such an es store already exists
#   - (404 Not Found)                         % project doesn't exist
# 
#   GET
#   - (200 OK) <Stores>                       % returns all existing es stores for the given project
#   - (404 Not Found)                         % project doesn't exist
# 
# 
# header: /gdc/projects/<project>/eventStore/stores/<store-id>
# 
#   GET
#   - (200 OK) <Store>                        % returns the given es store
#   - (404 Not Found)                         % either the project or the es store doesn't exist
# 
#   DELETE
#   - (204 No Content)                        % the given es store was successfully deleted
#   - (404 Not Found)                         % either the project or the es store doesn't exist
# 
#   
# header: /gdc/projects/<project>/eventStore/stores/<store-id>/truncateTasks
#   
#   POST - <TruncateTask>
#   - (201 Created) <AsyncTask>             % creates new truncate task, returns a link to a resource to poll
#   - (404 Not Found)                         % the project doesn't exist
#
# 
# header: /gdc/projects/<project>/eventStore/stores/<store-id>/truncateTasks/<taskId>
#   
#   GET
#   - (202 Accepted)                          % the task is still running
#   - (204 No Content)                        % done
#   - (410 Gone) <Error>                      % the task has finished unsuccessfully
# 
# 
# header: /gdc/projects/<project>/eventStore/stores/<store-id>/readTasks
#   
#   POST - <ReadTask>
#   - (201 Created) <AsyncTask>             % creates new read task, returns a link to a resource to poll
#   - (404 Not Found)                         % the project doesn't exist
# 
# 
# header: /gdc/projects/<project>/eventStore/stores/<store-id>/readTasks/<taskId>
#   
#   GET
#   - (202 Accepted)                          % the task is still running
#   - (204 No Content)                        % done
#   - (410 Gone) <Error>                      % the task has finished unsuccessfully
# 
# 
# header: /gdc/projects/<project>/eventStore/stores/<store-id>/uploadTasks
#   
#   POST - <UploadTask>
#   - (201 Created) <AsyncTask>             % creates new upload task, returns a link to a resource to poll
#   - (404 Not Found)                         % the project doesn't exist
# 
#
# header: /gdc/projects/<project>/eventStore/stores/<store-id>/uploadTasks/<taskId>
#   
#   GET
#   - (202 Accepted)                          % the task is still running
#   - (204 No Content)                        % done
#   - (410 Gone) <Error>                      % the task has finished unsuccessfully
#   
# 
# header: /gdc/projects/<project>/eventStore/stores/<store-id>/entities
# 
#   GET
#   - (200 OK) <ESEntities>                  % returns all existing ES entities for the given event store
#   - (404 Not Found)                         % either the project or event store  <store-id> does not exist
#
#
# header: /gdc/projects/<project>/eventStore/stores/<store-id>/entities/<entityName>
#
#   GET
#   - (200 OK) <ESEntity>                        % returns the given ES entity
#   - (404 Not Found)                         % either the project, the event store or entity doesn't exist
#
#   PUT - <ESEntity>
#   - (200 OK) <ESEntity>                        % returns the updated ES entity
#   - (404 Not Found)                         % either the project, the event store or entity doesn't exist
#
#   DELETE
#   - (204 No Content)                        % the given ES enity was successfully deleted
#   - (404 Not Found)                         % either the project, the event store or the entity
#
########################################################################################################### 
# Group: Data Structures
# 
# header: Store
#   (start code)
#   Store = <store : {
#     storeId: STRING|[a-zA-Z0-9_\-]+|
#   }>
#   (end)
# 
# 
# header: Stores
#   (start code)
#   Stores = <collection : {
#     items : [Store]
#   }>
#   (end)
# 
# 
# header: TruncateTask
#   (start code)
#   TruncateTask = <truncateTask : {
#     timestamp : INT,
#     entity : STRING
#   }>
#   (end)
# 
# 
# 
# header: ReadTask
#   (start code)
#   ReadTask = <readTask : {
#     entity : STRING,
#     readMap : STRING,
#     computedStreams : STRING,
#     timeFrames : [TimeFrame],
#     timezone : STRING
#   }>
#   (end)
#
#
# header: TimeFrame
#   (start code)
#   TimeFrame = {
#     startDate : STRING|[0-9]{4}-[0-9]{2}-[0-9]{2}|,       % YYYY-MM-DD
#     endDate :  STRING|[0-9]{4}-[0-9]{2}-[0-9]{2}|,        % YYYY-MM-DD
#     (exactTime : STRING|[0-9]{2}:[0-9]{2}:[0-9]{2}|)?,    % HH:MM:SS, default 00:00:00,
#     (timezone: STRING)?,                                  % timezone used for startDate, endData and exactTime handling, default UTC
#     interval : INT,
#     (intervalUnit: 'day' | 'week' | 'month' | 'year')?,   % unit of the interval value, default 'day'
#     dayWithinPeriod: 'FIRST' | 'LAST' | INT               % 'FIRST', 'LAST' or an integer
#   }
#   (end)
#
# 
# header: UploadTask
#   (start code)
#   UploadTask = <uploadTask : {
#     entity : STRING,
#     file : STRING,
#     (timestamp : INT)?,
#     attributes : [ESAttribute]
#   }>
#   (end)
#
#
# header: ESEntities
#   (start code)
#   ESEntities = <collection : {
#     items : [ESEntity]
#   }>
#   (end)
#
#
# header: ESEntity
#   (start code)
#   ESEntity = <entity : {
#     entityName : STRING,
#     attributes : [ESAttribute],
#     (links: {
#         self : URISTRING
#     })?
#   }>
#   (end)
#
#
# header: ESAttribute
#   (start code)
#   ESAttribute = {
#     name : STRING,
#     type : 'timeAttribute' | 'fact' | 'attribute' | 'recordid' | 'isDeleted' | 'timestamp'
#   }
#   (end)
#

#######################################################################################
# Group: Mock-up
#
#   (start example)
#	POST /gdc/projects/<project>/eventStore/stores
#	BODY: {"store":{"storeId":"myestore"}}
#	Response
#	HEAD: 201
#	BODY: {"uri":"/gdc/projects/<project>/dataload/eventstore/stores/myestore"}
#   (end)
#

#######################################################################################
# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
#

