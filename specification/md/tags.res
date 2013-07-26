# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: tags
#

###############################################################################
# Group: Description
#
# List of all tags with additionall info.  List of all objects tagged by specific tag(s)
# Asi pro začátek frekvence / # of all objects
# nicméně budu to potom potřebovat nějak normovat… ale to už možná udělám client-side…
# nebo kdybys mohl, tak bys to mohl normovat ty… aby ten rozptyl váhy v
#každým seznamu co mi vrátíš byl stejnej… to znamená začínal třeba na 0.1
# a končil na 1.0 ať už je četnost jakákoliv…
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/tags/
#           /md/(\w+)/tags
#
#            GET - * -> <Tags>
#  
#   header: /md/<project>/tags/<tag>
#           /md/(\w+)/tags/(\w+)
#
#            GET - * -> <Entries>

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
