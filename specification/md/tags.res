# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: tags
#

###############################################################################
# Group: Description
#
#   __Resource to manage tags of metadata objects.__
#
#   The resource provides list of all tags with additional info, or list of
#   all objects tagged by specific tag(s).
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/md/<project>/tags
#           /gdc/md/(\w+)/tags
#
#            GET - *
#		-> 200 <Tags>
#  
#   header: /gdc/md/<project>/tags/<tag>
#           /gdc/md/(\w+)/tags/(\w+)
#
#            GET - *
#		-> 200 <Entries>

###############################################################################
# Group: Data Structures
#
#   header: Tags
#
#   (start code)
#   Tags = < tags : [Tag] >
#   (end)
#
#   header: Tag
#
#   (start code)
#   Tag = {
#      title : STRING,
#      frequency : INT,
#      recency: DATETIME,
#      (category : 'Tag')?
#   }
#   (end)
#
