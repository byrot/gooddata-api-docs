# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: dimension
#

###############################################################################
# Group: Description
#
#      List of objects adherent to dimensions. With description of dimension.
#   *!!! When attribute has no role, then string 'norole' is use for oriented graph!!!*
#   Provides a list of objects adherent to dimensions. With description of dimension.
#

###############################################################################
# Group: Resource(s)
#
#   header: /md/<project>/query/dimension
#       /md/(\w+)/query/dimension
#
#       POST - <Req> -> <Dimension>
#  
#   header: /md/<project>/query/dimension/(id)
#           /md/(\w+)/query/dimension/(\w+)
#
#        GET - * -> <Dimension>
#  

###############################################################################
# Group: Data Structures
#
#   header: Example??? 
#
#   (start example)
#  --- 
#  dimensionbyrole: 
#    content: 
#      attr: 
#        edges: 
#          fakturujici: 
#            - 
#              from: 0
#              to: 11
#            - 
#              from: 3
#              to: 13
#            - 
#              from: 5
#              to: 12
#            - 
#              from: 11
#              to: 15
#            - 
#              from: 13
#              to: 0
#            - 
#              from: 15
#              to: 12
#          odebirajici: 
#            - 
#              from: 8
#              to: 17
#            - 
#              from: 10
#              to: 7
#            - 
#              from: 14
#              to: 7
#            - 
#              from: 16
#              to: 8
#            - 
#              from: 17
#              to: 10
#            - 
#              from: 20
#              to: 16
#          planujici: 
#            - 
#              from: 1
#              to: 18
#            - 
#              from: 2
#              to: 6
#            - 
#              from: 4
#              to: 9
#            - 
#              from: 6
#              to: 9
#            - 
#              from: 18
#              to: 19
#            - 
#              from: 19
#              to: 2
#        links: 
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/kraj.fakturujici
#            title: Region (Invoiced)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/stat.planujici
#            title: Country (Plan)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/okres.planujici
#            title: District (Plan)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/stat.fakturujici
#            title: Country (Invoiced)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/typ_zakaznika.planujici
#            title: Type of customer (Plan)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/typ_zakaznika.fakturujici
#            title: Type of customer (Invoiced)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/misto.planujici
#            title: Location (Plan)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/zakaznik.odebirajici
#            title: Customer (Ordering)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/kraj.odebirajici
#            title: Region (Ordering)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/zakaznik.planujici
#            title: Customer (Plan)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/misto.odebirajici
#            title: Location (Ordering)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/okres.fakturujici
#            title: District (Invoiced)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/zakaznik.fakturujici
#            title: Customer (Invoiced)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/oblast.fakturujici
#            title: Area (Invoiced)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/typ_zakaznika.odebirajici
#            title: Type of customer (Ordering)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/misto.fakturujici
#            title: Location (Invoiced)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/oblast.odebirajici
#            title: Area (Ordering)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/okres.odebirajici
#            title: District (Ordering)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/oblast.planujici
#            title: Area (Plan)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/kraj.planujici
#            title: Region (Plan)
#          - 
#            category: Attribute
#            link: /gdc/md/BeeDemo/obj/stat.odebirajici
#            title: Country (Ordering)
#      role: 
#        - 
#          id: planujici
#          title: Plan
#        - 
#          id: fakturujici
#          title: Invoiced
#        - 
#          id: odebirajici
#          title: Ordering
#    meta: 
#      category: Dimension
#      summary: Customer Dimension
#      title: Customer
#   (end)

################################################################################
# Group: Info
#
# About: Owner(s)
#
#
#
