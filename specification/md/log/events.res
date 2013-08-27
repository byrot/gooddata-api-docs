# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: log/events
#

###############################################################################
# Group: Description
#
#    Generator of changelog. Generates list of last changed items by time period 
#    (e.g. /today, /yesterday ...). To GET RSS 2.0 it's important to set header on:
#    Accept: text/xml
#
#    Note: The homepage feed is not in RSS format, it uses a custom format that 
#    can be used in javascript code on the homepage. All other feeds are RSS. 
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/log/events
#
#       GET - *
#		-> 200 <Events>
#

###############################################################################
# Group: Data Structures
#
#   header: Event
#
#   (start code)
#    Event = {
#       (author: URISTRING)?,
#       type: create | delete | move | rename | update | system,
#       content: EventContent,
#       date: DATETIME
#    }
#   (end)
#
#   header: Events
#
#   (start code)
#   Events = <events: [Event]>
#   (end)
#
#   header: EventContent
#
#   (start code)
#   EventContent = SystemMaintananceEventContent | CreateEventContent | DeleteEventContent | MoveEventContent | RenameEventContent | UpdateEventContent
#   (end)
#
#   header: SystemMaintananceEventContent
#
#   (start code)
#    SystemMaintananceEventContent = {
#       message: STRING
#    }  
#   (end)
#
#   header: CreateEventContent
#
#   (start code)
#    CreateEventContent = {
#       object: LINK,
#       (related: LINK)?,
#       (data: STRING)?
#    }
#   (end)
#
#   header: DeleteEventContent
#
#   (start code)
#    DeleteEventContent = {
#       object: LINK,
#       (related: LINK)?,
#       (data: STRING)?
#    }
#   (end)
#
#   header: MoveEventContent
#
#   (start code)
#    MoveEventContent = {
#       object: LINK,
#       from: LINK | NULL,
#       to: LINK | NULL
#    }
#   (end)
#
#   header: RenameEventContent
#
#   (start code)
#    RenameEventContent = {
#       object: LINK,
#       (related: LINK)?,
#       renameFrom: STRING
#    }  
#   (end)
#
#   header: UpdateEventContent
#
#   (start code)
#    UpdateEventContent = {
#       object: LINK
#    }  
#   (end)

###############################################################################
# Group: Event examples in JSON
#
#   (start example)
#   events: [{
#      author: "/uri",
#      type: "move",
#      content: {
#         object: {
#            category: "report",
#            title: "Report 1",
#            link: "/uri"
#         },
#         from: {
#            category: "space",
#            title: "Space 1",
#            link: "/uri"
#         },
#         to: {
#            category: "space",
#            title: "Space 2",
#            link: "/uri"
#         }
#      }
#      date: "2008-1-1 15:00"
#   }]
#   (end)
#
#   header: 
#
#   (start example)
#   (end)
#
################################################################################
# Group: Info
#
# About: Owner(s)
#
#       Jakub Sedlacek
#
