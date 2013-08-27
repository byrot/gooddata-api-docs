# Copyright (C) 2007-2013, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: obj
#

###############################################################################
# Group: Description
#
#   __Metadata objects maintenance resource.__
#
#   To create, delete, replace, modify and get definition of metadata objects.
#   Metadata objects are for example attributes, facts, metrics, reports,
#   report definitions, dashboards, etc.
#
#   __Related resources:__
#
#   - /gdc/md/<project>
#   - /gdc/md/<project>/query
#   - /gdc/md/<project>/dashboard
#   - /gdc/md/<project>/favorite
#   - /gdc/md/<project>/reportdefinition
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/obj
#           /gdc/md/(\w+)/obj
#
#       POST - Object
#		-> 200 URI    % Creates new object
#
#           /gdc/md/(\w+)/obj?createAndGet=true
#
#       POST Object -> Object
#
#
# header: /gdc/md/<project>/obj/<id>(?mode=MODE)
#         /gdc/md/(\w+)/obj/(\w+)
#
#	GET - *
#		-> 200 Object
#
# MODE : 'edit'|'raw'
#  % edit - restricted to mime type application/xhtml, generate gpUI
#  % raw - do provide basic structures
#
#
# header: /gdc/md/<project>/obj/<id>
#         /gdc/md/(\w+)/obj/(\w+)
#
#           GET - NULL
#		-> 200 Object    % Get current object representation
#           PUT - Object
#		-> 200 URI     % Replace object (URI is uri to self)
#           POST - Object
#		-> 200 URI    % Merge current object with sent Object (URI is uri to self)
#           DELETE - NULL
#		-> (204 No Content) % Delete object
#

###############################################################################
# Group: Security Consideration
#
#   header: /gdc/md/<project>
#     GET - project membership
#     POST - project membership
#     PUT - project membership
#     DELETE - project membership
#
#   header: /gdc/md/<project>/obj/<id>
#
#     POST - object ownership, class type
#        attribute: canManageAttribute
#        attributeDisplayForm: canManageAttributeLabel
#        fact: canManageFact
#        scheduledMail: canManageScheduledMail
#        dimension: canManageAttributeGroup
#        etlFile: canManageETLFile
#
#   header: /gdc/md/<project>/obj/<id>
#
#     PUT - object ownership, class type
#        attribute: canManageAttribute
#        attributeDisplayForm: canManageAttributeLabel
#        fact: canManageFact
#        scheduledMail: canManageScheduledMail
#        dimension: canManageAttributeGroup
#        etlFile: canManageETLFile
#
#     POST - object ownership, class type
#        attribute: canManageAttribute
#        attributeDisplayForm: canManageAttributeLabel
#        fact: canManageFact
#        scheduledMail: canManageScheduledMail
#        dimension: canManageAttributeGroup
#        etlFile: canManageETLFile
#
#     DELETE - object ownership, class type
#        attribute: canManageAttribute
#        attributeDisplayForm: canManageAttributeLabel
#        fact: canManageFact
#        scheduledMail: canManageScheduledMail
#        dimension: canManageAttributeGroup
#        etlFile: canManageETLFile


###############################################################################
# Group: Data Structures
#
# Group: 2. Ubiquitous structures
#
#   header: Identifier
#
#   (start code)
#     Identifier = STRING[1,255]	% allowed characters [a-zA-Z0-9_.]
#   (end)
#
#   header: LINK
#
#   (start code)
#    LINK = {
#       link : URISTRING,
#       (title : STRING[0,65536])?,
#       (category : STRING)?,
#       (summary : STRING)?,
#       (tags : TAGS)?,
#       (author : PROFILEURI)?,
#       (created : DATETIME)?,
#       (contributor : PROFILEURI)?,
#       (updated : DATETIME)?,
#       (deprecated: BOOLEAN)?,  % Default is false.
#       (projectTemplate: URISTRING)?,
#       (help: URISTRING)?,
#       (identifier: Identifier)?
#    }
#   (end)
#
#   header: ElementLink
#
#   (start code)
#    ElementLink = {
#      uri : URISTRING,
#      attributeUri : URISTRING,	% relates to attribute of element
#      title : STRING[0,65536] | NULL,
#      category : 'attributeElement',
#      (state : 'NOTFOUND')?,  % in case element-item from MAQL tree is not presented in DWH
#   }
#   (end)
#
#   header: Links
#
#   (start code)
#     Links = [ LINK ]
#   (end)
#
#   header: Meta
#
#   (start code)
#    Meta = {
#       title : STRING[1,255],   % title can't contain only whitespace characters
#       (category : STRING)?,
#       (summary : STRING)?,
#       (tags : TAGS)?,
#       (author : PROFILEURI)?,      % this field is ignored in POST and PUT and is set by server automatically
#       (created : DATETIME)?,      % this field is ignored in POST and PUT and is set by server automatically
#       (contributor : PROFILEURI)?, % this field is ignored in POST and PUT and is set by server automatically
#       (updated : DATETIME)?,      % this field is ignored in POST and PUT and is set by server automatically
#       (deprecated: BOOLEAN)?,     % Default is false.
#       (projectTemplate: URISTRING)?,
#       (uri: URISTRING)?,          % this field is ignored in POST and PUT and is set by server automatically
#       (identifier: Identifier)?
#    }
#   (end)
#
#   header: Entries
#
#   (start code)
#   Entries = < entries : [LINK] >
#   (end)
#
#   header: ERROR
#
#   (start code)
#   ERROR = {
#		component  : STRING,
#		message    : STRING,
#		errorClass : STRING,
#		parameters : [ STRING ],
#		(errorCode : STRING)?,
#		(errorId   : STRING)?,
#		(requestId : STRING)?,
#		(trace    : STRING)?
#	}
#   (end)
#
#   header: Error
#
#   (start code)
#   Error = < error : ERROR >
#   (end)
#
#   header: URIResponse
#
#   (start code)
#	URIResponse = < uri : URISTRING >
#   (end)
#
#   header: URIResponses
#
#   (start code)
#	URIResponses = < uris : [ URISTRING ] >
#   (end)
#
# Group: 3. Base analytical structures
#
#   header: Fact
#
#   (start code)
#    Fact = < fact : {
#       meta : Meta,
#
#       %ifdef IN_ONLY
#         content : FactContent
#       %endif
#       %ifdef OUT_ONLY
#         ( content : FactContent )?
#       %endif
#    }>
#   (end)
#
#   header: FactContent
#   (start code)
#   FactContent = {
#     expr: [ {
#       data: URISTRING,
#       (function: 'SUM'|'MAX'|'MIN'|'AVG')?,
#       type: STRING
#     } ],
#     (folders: [URISTRING])?
#   }
#   (end)
#
#   header: AttributeDisplayForm
#
#   (start code)
#    AttributeDisplayForm = < attributeDisplayForm : {
#       meta : Meta,
#
#       %ifdef IN_ONLY
#         (links : { elements : URISTRING })?,
#       %endif
#       %ifdef OUT_ONLY
#         links : { elements : URISTRING },
#       %endif
#
#       content : {
#          formOf: URISTRING,
#          expression: STRING, %CONCAT( ((STRING)? | ([URISTRING])?)* )
#          (ldmexpression: STRING)?, %CONCAT( ((STRING)? | ([URISTRING])?)* )
#          (type: STRING)?,
#          (default: INT)?,
#       }
#    } >
#   (end)
#
#   header: NestedAttributeDisplayForm
#
#   (start code)
#    NestedAttributeDisplayForm = {
#
#       %ifdef OUT_ONLY
#         links : { elements : URISTRING },
#       %endif
#
#       %ifdef IN_ONLY
#          (links : { elements : URISTRING })?,
#       %endif
#
#       meta : Meta,
#
#       content : {
#       %ifdef OUT_ONLY
#          formOf: URISTRING,
#       %endif
#
#       %ifdef IN_ONLY
#          (formOf: URISTRING)?,
#       %endif
#
#          expression: STRING, %CONCAT( ((STRING)? | ([URISTRING])?)* )
#          (ldmexpression: STRING)?, %CONCAT( ((STRING)? | ([URISTRING])?)* )
#          (type: STRING)?,
#       },
#    }
#   (end)
#
#   header: AttributeContent
#
#   (start code)
#    AttributeContent = {
#          ( pk: [ {
#             data: URISTRING,
#             type: STRING
#            } ]
#          )?,
#          ( fk: [ {
#             data: URISTRING,
#             type: STRING
#            } ]
#          )?,
#          ( compositeAttribute: [ URISTRING ] )?,
#          ( compositeAttributePk: [ URISTRING ] )?,
#          (dimension: URISTRING)?,
#          (roleOf: URISTRING)?,
#          displayForms : [NestedAttributeDisplayForm], %! order of DF in this list will set the weight of specific DF itself, but content of this DF will not be saved
#          (sort: pk | byUsedDF | SortDF)?,
#          (direction: asc | desc)?,
#          (drillDownStepAttributeDF : URISTRING )?,
#          (linkAttributeDF : URISTRING )?, % Other display form of the same attribute containing URL
#          (folders : [ URISTRING ] )?,
#          (type : STRING )?
#       }
#
#    AttributeContentV1 = {
#          ( pk: [ {
#             data: URISTRING,
#             type: STRING
#            } ]
#          )?,
#          ( fk: [ {
#             data: URISTRING,
#             type: STRING
#            } ]
#          )?,
#          (dimension: URISTRING)?,
#          (direction: asc | desc)?,
#          (drillDownStepAttributeDF : URISTRING )?,
#          (linkAttributeDF : URISTRING )?, % Other display form of the same attribute containing URL
#          (sort: pk | byUsedDF | SortDF)?,
#          (type : STRING )?
#   }
#   (end)
#
#   header: Attribute
#
#   (start code)
#    Attribute = < attribute : {
#       meta : Meta,
#       content : AttributeContent | AttributeContentV1
#    } >
#   (end)
#
#   header: SortDF
#
#   (start code)
#    SortDF = < df : {
#       uri : URISTRING
#    } >
#   (end)
#
#   header: NestedAttribute
#
#   (start code)
#    NestedAttribute = {
#       meta : Meta,
#       content : AttributeContent,
#    }
#   (end)
#
#
#
# Group: 4. Vizual definition structures
#
#   header: Grid
#
#   (start code)
#    SortRule = AttributeSortRule | MetricSortRule
#
#    % Sorting by attribute values.
#    AttributeSortRule = <attributeSort: {
#       uri: URISTRING,                    % URI of attribute or attributeDisplayForm
#       direction: asc | desc
#    }>
#
#    % Sorting by metric.
#    MetricSortRule = <metricSort: {
#       direction: asc | desc,
#       locators: SortLocators  % Attributes, metrics and totals that form the header sorting path.
#                               % If sorting columns by metric values in a particular row, locators
#				% contain attributes/metric/total in that row and vice versa.
#    }>
#
#    Sort = {
#       columns: [SortRule],
#       rows: [SortRule]
#    }
#
#    AttributeInGrid = < attribute : {
#          uri : URISTRING,
#          totals : [  [ TotalKind ]  ], % totals for metrics with same order as metrics defined.
#                                        % For each metric is one array of TotalKind, (empty array with no TotalKind)
#          alias : STRING
#       } >
#
#    GridElement = metricGroup | URI | AttributeInGrid  % URI is allowed for backward compatibility
#                                                       % metricGroup can be maximally one time in rows or columns
#
#    GridContent = {
#       rows:     [GridElement],
#       columns:  [GridElement],
#       metrics:  [ {
#          uri : URISTRING,		% may contain runningTotal=type
#          alias: STRING,
#          (format: STRING)?,
#          (drillAcrossStepAttributeDF: URISTRING)?
#       } ],
#       sort: Sort,
#       columnWidths: [ColumnWidth],
#    }
#
#
#	ColumnWidth = {
#		locator: Locators,
#		width: INT
#	}
#
#	SortLocators = [ AttributeLocator | MetricLocator | TotalLocator | ValuesLocator ]
#
#	Locators = [ AttributeLocator | MetricLocator | TotalLocator | AttributeHeaderLocator | EmptyLocator | ValuesLocator ]
#
#	AttributeHeaderLocator = < attributeHeaderLocator : {
#		uri: URISTRING   % uri of attribute
#	}>
#
#	EmptyLocator = < emptyLocator : NULL >
#
#	ValuesLocator = < valuesLocator : NULL >
#
#
#
#    Grid = < grid : {
#       meta : Meta,
#       content: GridContent
#    } >
#   (end)
#
#   header: ReportFormat
#   (start code)
#    ReportFormat = 'grid' | 'chart' | 'oneNumber'
#   (end)
#
#   header: OneNumberVisualization
#   (start code)
#   OneNumberVisualization = {
#       labels: {
#           (description: STRING)?
#       }
#   }
#   (end)
#
#   header: GridVisualization
#   (start code)
#   GridVisualization = {
#       columnWidths: [ColumnWidth]
#   }
#   (end)
#
#
#   header: Chart
#
#   (start code)
#    ChartContent = {
#       type:       STRING,
#       buckets:  {
#          x:        [ChartBucketItem],
#          y:        [ChartBucketItem],
#          (color:   [ChartBucketItem])?,
#          (angle:   [ChartBucketItem])?,
#          (size:    [ChartBucketItem])?,
#          (detail:  [ChartBucketItem])?,
#          (marker:  [ChartBucketItem])?
#       },
#       (axes:       [ChartAxisItem])?,
#       (styles:     { (STRING: ChartStyle)* })?,
#       (sort:       {    % detail can be found here: https://confluence.intgdc.com/display/analysis/Sorting+in+Charts
#           (x:       [ChartSortRule])?,
#           (y:       [ChartSortRule])?,
#           (color:   [AttributeChartSortRule])?
#       })?
#    }
#
#    ChartBucketItem = {
#       uri: URISTRING | metricGroup | metric,
#       (id: STRING)?
#    }
#
#    ChartAxisItem = {
#       locators: Locators,
#       id: STRING
#    }
#
#    ChartStyle = ChartAxisStyle | GlobalStyle
#
#    ChartAxisStyle = {
#       (axis: {
#            (display: none)?,
#            (charttype: STRING)?,
#            (limits: {
#                (min: FLOAT)?,
#                (max: FLOAT)?
#            })?,
#            (label: {
#                (display: none)?,
#                (rotation: INT)?
#            })?,
# 	         (majorlabel: {
#                (display: none)?,
#                (rotation: INT)?,
#                (count: INT)?
#            })?
#        })?
#    }
#
#    GlobalStyle = {
#       (preset: headline)?,
#       (legend: {
#           display: none
#       })?,
#       (font: {
#           size: INT
#       })?,
#       (linetype: smooth)?,
#       (gridlines: {
#           display: none
#       })?,
#       (dataPoints: {
#           display: none
#       })?,
#       (datalabels: {
#           display: none | inline,
#           percent: BOOLEAN,
#           displayValues: BOOLEAN,
#           displayTotals: BOOLEAN,
#           fontsize: auto | INT,
#           (displayBoxed: BOOLEAN)?
#       })?,
#       (colorMapping: [ColorMappingItem])?,
#       (elementMapping: [ElementMappingItem])?,
#       (waterfallConfig: {
#           fixedMapping: [URISTRING],	% may contain runningTotal=type
#           (colorMapping: {
#               (positive: STRING)?,    % guid
#               (negative: STRING)?,    % guid
#               (fixed: STRING)?        % guid
#           })?,
#           (connectionLines: BOOLEAN)?
#       })?
#    }
#
#    ColorMappingItem = {
#       (uri: URISTRING)?,	% may contain runningTotal=type
#       guid: STRING
#    }
#
#    ElementMappingItem = {
#       (id: URISTRING)?,	% may contain runningTotal=type
#       (charttype: STRING)?
#    }
#
#    ChartSortRule = MetricChartSortRule | AttributeChartSortRule
#
#    % Sorting by attribute
#    AttributeChartSortRule = <attributeChartSort: {
#        direction: asc | desc,
#        uri: URISTRING    % URI of attributeDisplayForm
#    }>
#
#    % Sorting by metric.
#    MetricChartSortRule = <metricChartSort: {
#        direction: asc | desc,
#        locators: {
#            (x:       ChartSortLocators)?,
#            (y:       ChartSortLocators)?,
#            (color:   ChartSortLocators)?
#        }
#    }>
#
#   ChartSortLocators = [ AttributeLocator | MetricLocator ]
#
#   (end)
#
#   header: Folder
#
#   (start code)
#    Folder = < folder : {
#       meta : Meta,
#       content : {
#          type : [STRING],		% possible values are 'attribute','metric','fact' - in the future all metadata object types
#          (entries : [LINK])?  % objects that belong to this folder
#      }
#    }>
#   (end)
#
#   header: Format3d
#
#   (start code)
#    Format3d = < format3d : {
#       meta : Meta,
#       content : {
#          (form : STRING)?,
#          (type : STRING)?
#       }
#    }>
#   (end)
#
#   header: Graph3d
#
#   (start code)
#    Graph3d = < graph3d : {
#       meta : Meta,
#       content : {
#          (axisX : Graph3dAxisDefinition)?,
#          (axisY : Graph3dAxisDefinition)?,
#          (axisZ : Graph3dAxisDefinition)?,
#          (shape : Graph3dAxisDefinition)?,
#          (diameter : Graph3dAxisDefinition)?,
#          (transparency : Graph3dAxisDefinition)?,
#          (pages : Graph3dAxisDefinition)?,
#          (color : Graph3dAxisDefinition)?
#       }
#    }>
#   (end)
#
#   header: Graph3dAxisDefinition
#
#   (start code)
#    Graph3dAxisDefinition = < graph3dAxisDefinition : {
#          (quantity : STRING)?,
#          (items : [Attribute])?,
#          (min : INT)?,
#          (max : INT)?,
#          (default : STRING)?,
#          (interpolation : STRING)?
#    }>
#   (end)
#
#   header: Project Dashboard
#
#   (start code)
#   ProjectDashboard = < projectDashboard : {
#       meta: Meta,
#       content: {
#           (logo: URISTRING)?,
#           tabs: [DashboardTab],
#           filters: [FilterItemContent]    % Filter content referenced by filterItems on dashboard tabs
#       }
#   }>
#   (end)#
#
#   (start code)
#   DashboardTab = {
#       (identifier: STRING)?,
#       title: STRING,
#       (items: [ReportItem | LineItem | TextItem | VariableItem | IFrameItem | FilterItem | HeadlineItem | GeoChartItem | FilterApplyItem])? % not returned from /gdc/projects/{projectId}/dashboards resource when not explicitly requested
#   }
#   (end)
#
#   (start code)
#   ItemStyle = {
#       background: {
#           (opacity: FLOAT)?
#       }
#   }
#   (end)
#
#   (start code)
#   ReportItem = < reportItem : {
#       obj: URISTRING,
#       positionX: INT,
#       positionY: INT,
#       sizeX: INT,
#       sizeY: INT,
#       filters: [STRING],          % id of filterItems to apply to this report
#       (style: ItemStyle)?,
#       (visualization: ReportItemVisualization)?,
#       (drills: [Drill])?
#   }>
#   (end)
#
#   (start code)
#   Drill = {
#       target: 'pop-up' | 'in-place' | 'new-window',
#       definition: DrillDefinition
#   }
#
#   DrillDefinition = DrillToAttributeDFs | DrillToReports
#
#   DrillToAttributeDFs = < drillToAttributeDFs : {
#       fromMetrics: [ URISTRING ],
#       fromAttributes: [ URISTRING ],
#       toDisplayForms: [ URISTRING ]
#   } >
#
#   DrillToReports = < drillToReports : {
#       fromMetrics: [ URISTRING ],
#       fromAttributes: [ URISTRING ],
#       toReports: [ URISTRING ]
#   } >
#   (end)
#
#   (start code)
#   ReportItemVisualization = {
#       (oneNumber: OneNumberVisualization)?,
#       (grid: GridVisualization)?
#   }
#   (end)
#
#   (start code)
#   FilterItem = < filterItem : {
#       id: STRING,                          % filter id, serves for referencing from a reportItem
#       positionX: INT,
#       positionY: INT,
#       sizeX: INT,
#       sizeY: INT,
#       contentId: STRING,                   % id of FilterItemContent
#       (parentFilters: [ ParentFilter ])?,  % parent filters in the cascade
#       (multiple: BOOLEAN)?                 % should the UI allow selection of multiple items or just a single item
#   }>
#   (end)
#
#   (start code)
#   ParentFilter = < parentFilter : {
#       id: STRING,                          % filter id, serves for referencing from a reportItem
#       linkAttribute: URISTRING             % uri of attribute we link filter+parent filter through
#   }>
#   (end)
#
#   (start code)
#   FilterItemContent = < filterItemContent : {
#       id: STRING,                         % filter content id, serves for referencing from a filterItem
#       obj: URISTRING,                     % attribute DF / prompt uri
#       label: STRING,                      % filter label (title)
#       type: list | time,                  % filter type
#       (useAvailable: AvailableObjects)?,  % use availableElements, we expect metric URIs inside
#       % if default or universum is missing, it means all values
#       (default: FilterConstraint)?,       % default filter value
#       (universum: FilterConstraint)?,     % allowed filter values to select from (meaningless for filters originating from prompt filter, will be overriden on client)
#	(multiple: BOOLEAN)?                % should the UI allow selection of multiple items or just a single item
#   }>
#   (end)
#
#   (start code)
#   AvailableObjects = {
#       metrics: [ URISTRING ] % these metrics will be used when creating reportDefinition for availableElements (hint which fact table will be used)
#   }
#   (end)
#
#   (start code)
#   FilterConstraint = ListFilterConstraint | FloatingFilterConstraint | IntervalFilterConstraint
#
#   ListFilterConstraint = {
#       type: list,
#       elements : [URISTRING]
#   }
#
#   FloatingFilterConstraint = {
#       type: floating,
#       from: INT,
#       to: INT
#   }
#
#   IntervalFilterConstraint = {
#       type: interval,
#       from: STRING,   % ISO format YYYY-MM-DD
#       to: STRING      % ISO format YYYY-MM-DD
#   }
#   (end)
#
#   (start code)
#	TextItem = < textItem : {
#		text: STRING,
#		textSize: STRING,
#		positionX: INT,
#		positionY: INT,
#		sizeX: INT,
#		sizeY: INT,
#		(style: ItemStyle)?
#	}>
#   (end)
#
#   (start code)
#	IFrameItem = < iframeItem : {
#		url: STRING,
#		positionX: INT,
#		positionY: INT,
#		sizeX: INT,
#		sizeY: INT
#	}>
#   (end)
#
#   (start code)
#   VariableItem = < variableItem : {
#       obj: URISTRING,
#       positionX: INT,
#       positionY: INT,
#       sizeX: INT,
#       sizeY: INT,
#       (style: ItemStyle)?
#   }>
#   (end)
#
#   (start code)
#   LineItem = < lineItem : {
#       positionX: INT,
#       positionY: INT,
#       sizeX: INT,
#       sizeY: INT
#   }>
#   (end)
#
#   (start code)
#   TrendlineConfig = {
#       (granularityAttributeDF: URISTRING)?,
#       autoGranularity: INT          % true, if the granularity of the trendline is inferred automatically
#   }
#
#   HeadlineItem = < headlineItem : {
#       positionX: INT,
#       positionY: INT,
#       sizeX: INT,
#       sizeY: INT,
#       (style: ItemStyle)?,
#       (title: STRING)?,
#       (metric: URISTRING)?,
#       (format: STRING)?,
#       filters: [STRING],
#       (filterAttributeDF: URISTRING)?, % URI of the external filter attribute or attribute in the selected data dimension
#       linkedWithExternalFilter: INT, % just a hint if a checkbox shall be turned on
#       (constraint: FloatingFilterConstraint)?,
#       (trendlineConfig: TrendlineConfig)? % if exists the trendline will be displayed
#   }>
#   (end)
#
#   (start code)
#   LayerConfigItem = {
#       attributeDF: URISTRING,
#       showLayer: BOOLEAN % whether the attribute layer is shown on the map
#   }
#
#   GeoChartItem = < geoChartItem : {
#       positionX: INT,
#       positionY: INT,
#       sizeX: INT,
#       sizeY: INT,
#
#       (showLegend: BOOLEAN)?,
#       (showMap: BOOLEAN)?,
#       (style: ItemStyle)?,
#
#       (metric: URISTRING)?,
#       (layersBaseColor: STRING)?, % color guid from the palette, see ColorMappingItem
#       (layers: [LayerConfigItem])?,
#
#       (drills: [Drill])?,
#       (filters: [STRING])? % id's of filters
#   }>
#   (end)
#
#   (start code)
#   FilterApplyItem = < filterApplyItem : {
#       positionX: INT,
#       positionY: INT,
#       sizeX: INT,
#       sizeY: INT,
#
#       (style: ItemStyle)?,
#       (filters: [STRING])? % id's of filters
#   }>
#   (end)
#
#
# Group: 5. Analytical prepare structures
#
#   header: MAQLTree
#
#   (start code)
#   MAQLTree = {
#       type : MaqlAstType,
#       (value : STRING | DATE | INT)?,
#       position : MaqlAstPosition,
#       (content : [MAQLTree])?
#   }
#
#   MaqlAstPosition = {
#       line : INT,
#       column : INT
#   }
#
#   MaqlAstType = STRING
#   (end)
#
#
#   header: Metric
#
#   (start code)
#    Metric = < metric : {
#       meta : Meta,
#       content : {
#          expression : STRING[1,100000],
#          (tree : MAQLTree)?,
#          (format: STRING)?,
#          (folders: [URISTRING])?
#       }
#    }>
#   (end)
#
#   header: Filter
#
#   (start code)
#    FilterContent = {
#         expression: STRING[1,100000],
#         (tree: MAQLTree)?
#    }
#
#    Filter = < filter : {
#         meta : Meta,
#         content : FilterContent
#    }>
#   (end)
#
#   header: UserFilter
#
#   (start code)
#    UserFilterContent = {
#         expression: STRING[1,100000],
#         (tree: MAQLTree)?
#    }
#
#    UserFilter = < userFilter : {
#         meta : Meta,
#         content : UserFilterContent
#    }>
#   (end)
#
#   header: DynamicParam
#
#   (start code)
#    DynamicParam = < dynamicParam : {
#       meta : Meta,
#       content : {
#          (question : STRING)?,
#          (questionHelp : STRING)?,
#          (definition : DynamicParamDefinition)?,
#          (type : STRING)?
#       }
#    }>
#   (end)
#
#   header: DynamicParamDefinition
#
#   (start code)
#
#    DynamicParamDefinition = < dynamicParamDefinition : {
#          (prop : STRING)?,
#          (share : STRING)?,
#          (upLimit : INT)?,
#          (downLimit : INT)?,
#          (min : INT)?,
#          (max : INT)?,
#          (type : STRING)?,
#          (constraint : STRING)?,
#          (eids : [INT])?,
#          (alternatives : [ANY]|[URISTRING])?,
#          (viewAttributeForm : URISTRING)?
#    }>
#   (end)
#
# Group: 6. Report and analytical structures
#
#   header: ReportDefinition
#
#   (start code)
#    ReportFilter = FilterContent
#
#    ReportGrid = URI | GridContent
#
#    ReportDefinition = < reportDefinition : {
#       meta : Meta,
#       content : {
#          format : ReportFormat,
#          filters : [ReportFilter],
#          (chart : ChartContent)?,						% will be more structured later
#          (oneNumber : OneNumberVisualization)?,
#          grid : ReportGrid,
#       },
#       (links : {
#          explain: URISTRING,
#          (explain2 : URISTRING)?
#       })?,     % link to explain resource
#    }>
#   (end)
#
#   header: ReportMergedDefinition
#
#   (start code)
#    ReportMergedDefinition = < reportMergedDefinition : {
#       meta : Meta,
#       content : {
#          (allowMetricJoin : INT)?,
#          (menuDefinition : INT)?,
#          (mergedType : 'col' | 'row' )?,
#          (formatDefinition : ANY)?,     % (formatDefinition : Format)?,
#          (mergedList : [Attribute])?
#       }
#    }>
#   (end)
#
#   header: Domain
#
#   (start code)
#    Domain = < domain : {
#       meta : Meta,
#       content : {
#          (entries : [LINK])?
#       }
#    }>
#   (end)
#
#   header: ExecResult
#
#   (start code)
#   MetricInfo = {
#      metricId : URISTRING,		% may contain runningTotal=type
#      title    : STRING,
#      (format  : STRING)?,
#      (drillAcrossStepAttributeDF: URISTRING)?
#   }
#
#   GridAttributeInfo = {
#      attributeId    : URISTRING,
#      attributeTitle : STRING,
#      displayFormId  : URISTRING,
#      title          : STRING,
#      baseElementURI : URISTRING,
#      totals         : [  [ TotalKind ]  ],
#      (drillDownStepAttributeDF : URISTRING )?,
#      (linkAttributeDF : URISTRING )?,
#      (sort: pk | byUsedDF | SortDF)?,
#      (type: STRING)?
#   }
#
#   GridElementInfo = metricGroup | GridAttributeInfo
#
#   ReportView = {
#     rows    : [GridElementInfo],
#     columns : [GridElementInfo],
#     metrics : [MetricInfo],
#     filters : [ReportFilter],
#     sort    : Sort,
#     reportName  : STRING,
#     columnWidths: [ColumnWidth],
#     format : ReportFormat,
#     (chart      : ChartContent)?,
#     (oneNumber : OneNumberVisualization)?,
#     (summary : STRING)?
#   }
#
#    ExecResult = < execResult : {
#          dataResult  : URISTRING,	     % points to data
#          reportDefinition : URISTRING, % points to report definition
#          reportView  : ReportView,
#          (imageResult : URISTRING)?,   % link to the image representation of the result
#          (geoResult : URISTRING)?      % link to the geo representation of the result
#    }>
#   (end)
#
#   header: report
#
#   (start code)
#    Report = < report : {
#       meta : Meta,
#       content : {
#          domains  : [URISTRING],    % List of associated domains
#          definitions : [URISTRING]  % list of associated report definitions
#       }
#    }>
#   (end)
#
# Group: 7. Graph LDM structures
#
#   header: Dimension
#
#   (start code)
#    Dimension = < dimension: {
#       meta : Meta,
#       content: {
#           attributes: [NestedAttribute]
#       }
#     }>
#   (end)
#
#   header: LogicalEdge
#
#   (start code)
#    LogicalEdge = < logicalEdge: {
#       meta : Meta,
#       content: {
#                 from: Attribute,
#                 to: Attribute,
#                 (weight: INT)?
#          }
#     } >
#   (end)
#
# Group: 8. Collaboration structures
#
#   header: Notes
#
#   (start code)
#    Notes = < notes : {
#       title : STRING,
#       comments : URISTRING,
#       commentsMy : URISTRING
#    }>
#   (end)
#
#   header: Comment
#
#   (start code)
#    Comment = < comment : {
#       meta : Meta,
#       content : {
#          related : URISTRING,
#          content : STRING[1+],
#
#          %ifdef OUT_ONLY
#          (deleted : BOOLEAN)?
#          %endif
#       }
#    }>
#    AttributeLocator = < attributeLocator : {
#       uri: URISTRING,
#       element : INT           % id of attribute element
#    }>
#    MetricLocator = < metricLocator : {
#       uri: URISTRING		% may contain runningTotal=type
#    }>
#    TotalLocator = < totalLocator : {
#       uri: URISTRING,
#       type : TotalType   % aggregation function
#    }>
#   (end)
#
#   header: Favorite
#
#   (start code)
#    Favorite = < favorite : BOOLEAN >
#   (end)
#
# Group: 11. Information structures
#
#   header: About
#
#   (start code)
#   About = < about : {
#       summary : STRING,
#       links : [ LINK ],
#       category : STRING,   % FIXME: originally ResType
#       (instance : STRING)? % identificator of resource valid over all deployed resources of same type/category
#   }>
#   (end)
#
# Group: 13. PDM structures
#
#   header: Column
#
#   (start code)
#    Column = < column : {
#       meta : Meta,
#       content : {
#          table : URISTRING,
#          columnDBName : STRING,
#          (dataType : ANY)?,
#          (columnType : pk | inputpk | fk | fact | displayForm)?,
#          tableSortOrder : INT,
#          (originalColumn : STRING)?,
#          (columnConstrain : [ANY])?,
#          (columnIndex : columnIndex)?
#       }
#    }>
#
#    Table = < table : {
#       meta : Meta,
#       content : {
#          tableDBName : STRING,
#          (ttTableDBName : STRING)?,
#          (activeDataLoad : ANY)?,
#          (waitingDataLoad : ANY)?,
#          (tableDataLoad : [ANY])?,
#          (tableOptions : ANY)?,
#          (partitionOptions : ANY)?,
#          (weight : INT)?
#       }
#    }>
#
#    TableDataLoad = < tableDataLoad : {
#       meta : Meta,
#       content : {
#		dataSourceLocation : STRING,
#		typeOfLoad : 'full' | 'incremental',
#		(interface : URISTRING)?,
#		(backupCopy : STRING)?
#       }
#    }>
#
#    DataLoadingColumn = < dataLoadingColumn : {
#	meta: Meta,
#	content : {
#		column : URI, % reference to pdm-column
#		columnName : STRING,
#		columnType : STRING,		% VARCHAR, INT, ...
#		columnLength : INT|NULL,	% column lenght/size
#		columnPrecision : INT|NULL,	% decimal part of column length
#		columnUnique : BOOLEAN,		% column contains unique values
#		columnNull : BOOLEAN,		% column contains null values
#		(columnSynchronize : {
#			columnType : STRING,		% VARCHAR, INT, ...
#			columnLength : INT|NULL,	% column lenght/size
#			columnPrecision : INT|NULL	% decimal part of column length
#		})?
#	}
#    }>
#   (end)
#
# Group: 14. Real Data structures
#
#   header: SourceElementsRequest
#
#   (start code)
#   SourceElementsRequest = < source_elements_req : {
#     source : URISTRING,
#     (count : INT)?,   % amount of elements
#     (offset : INT)?,   % start listing from element with order number N
#     (sort : 'ASC' | 'DESC' | 'ID' )?,
#     (constrain : STRING)?,
#     (ids : [ INT ])?   % reduce ouptut by list of ids
#   }>
#   (end)
#
#
% sortSign = 'ASC' | 'DESC' | 'ID' % sort in ascending, descending or id order

%   header: DrillCrossPath
%

%   header: Role
%
%   Role = < role: {
%      meta : Meta,
%      content: {
%                logicalEdges:[LogicalEdge]
%         }
%    } >
%


# Group: 15. ETL
#
#   header: EtlFile
#
#   (start code)
#	EtlFile = < etlFile : {
#		meta : Meta,
#		content : {
#			(guessingTableName : STRING)?,
#			(fileSize : INT)?,
#			(md5sum : STRING)?,
#			(originName : STRING)?,
#			(fullUpload : BOOLEAN)?,
#			parseParam : {
#				colNumber : INT,
#				fieldSeparator : STRING,
#				lineFeed : STRING,	% CRLF | CR
#				charset : STRING,
#				escapedChar: STRING[1,2],
#				enclosedChar : STRING[1,2],
#				(datetimeFormat : STRING)?,
#				(timeFormat : STRING)?,
#				(dateFormat : STRING)?,
#				(ignoreLines   : INT)?
#			},
#			(warnings : ANY)?
#		}
#	}>
#   (end)
#
#   header: DataSet
#
#   (start code)
# DataSet = < dataSet : {
#    meta : Meta,
#    content : {
#      attributes : [ URISTRING ],
#      facts : [ URISTRING ],
#      ties : [ URISTRING ],         % explicit labels, while labels of attribute are not tie points automatically (fullname vs. id)
#      dataLoadingColumns : [ URISTRING ],
#      mode : 'SLI'|'DLI'|'',
#      (hasUploadConfiguration: '0' | '1')?  % this flag indicates if links.uploadConfiguration will be generated
#    },
#    %ifdef IN_ONLY
#      (links : {
#           dataUploads: URISTRING | NULL,  % link to data_uploads resource, NULL if there is not one
#           (uploadConfiguration: URISTRING)? % key in IN structure will be ignored
#      })?,
#    %endif
#    %ifdef OUT_ONLY
#      links : {
#           dataUploads: URISTRING | NULL, % link to data_uploads resource, NULL if there is not one
#           (uploadConfiguration: URISTRING)? % link to data set upload configuration stored in mongodb (webapp resource)
#      }
#    %endif
# }>
#   (end)

#   header: Prompt
#
#   (start code)
# Prompt = < prompt : {
#   meta : Meta,
#   content : {
#     type : 'filter'|'scalar',
#     (attribute : URISTRING)?	% relevant for type 'element'
#    }
# }>
#   (end)



# Group: 16. Help
#
#   header: Help
#
#   (start code)
#   Help = < help : {
#   meta: Meta,
#   content: {
#      (icon: URISTRING)?,
#      (helpPage: URISTRING)?
#   }
#   }>
#   (end)

# Group: 17. ScheduledMail
#
#   header: ScheduledMail
#
#   (start code)
#	ScheduledMail = < scheduledMail : {
#		meta : Meta,
#		content: {
#			when : {
#				recurrency  : STRING,
#				startDate   : DATE,
#				timeZone    : TIMEZONENAME,
#	            (endDate     : DATE)?,
#           },
#			to          : [ EMAIL ],
#			subject     : STRING[255],
#			body        : TEXT,
#			attachments : [ ReportAttachment | DashboardAttachment ],
#			(lastSuccessfull : DATETIME)?,      % (ignored in POST or PUT)
#		}
#	}>
#
#
#   ReportAttachment = < reportAttachment : {
#                    uri     :  URISTRING,           % uri string pointed to report
#                    formats : [ xls | pdf | html | csv ]  % there can be other attachment type in the future
#                }>
#
#   DashboardAttachment = < dashboardAttachment : {
#                    uri     :  URISTRING,           % uri string pointed to report
#                    allTabs : BOOLEAN,              % export all tabs. If set to true, tabs element is ignored
#                    tabs: [STRING]
#                }>
#   (end)
#

# Group: 18. Raw objects
#
#   You can get objects without enrichment, which is roughly 50% than getting enriched objects. See
#   https://confluence.gooddata.com/confluence/display/analysis/Dashboard+Filters+-+resource+performance+optimization#DashboardFilters-resourceperformanceoptimization-Speededobjresource
#   We support these getting raw object content on GET of /md/(\w+)/obj resource:
#
#
#   AttributeDisplayFormV1 = AttributeDisplayForm
#
#   PromptV1 = Prompt
#
#   AttributeContentV1 - see above
#
#   ReportDefinitionV1 = ReportDefinition  % with the exception that reportDefinition.content.filters.[ReportFilter.objects] is not optional but missing.
#


###############################################################################
# Group: Mock-up
#
#   header: Create a metric
#   (start example)
#	POST /gdc/md/<project>/obj
#	BODY: {"metric":{"meta":{"title":"Amount (Sum)"},"content":{"expression":"CREATE METRIC {m.amount.sum} AS SUM({f.amount})"}}}
#	Response
#	HEAD: 200 Ok
#	BODY: TODO
#   (end)
#
