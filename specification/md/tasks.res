# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: tasks
#
# Tasks public resources.

###############################################################################
# Group: Description
#
#   Resources to monitor asynchronous tasks.
#

###############################################################################
# Group: Resource(s)
###############################################################################

###############################################################################
# Resource: tasks
#
#   Navigation resource to tasks resources.
#
# Topic: Synopsis
#
#   header: /gdc/md/<project>/tasks
#
#   GET - *
#     - (200 Ok) <About>
#

###############################################################################
# Resource: tasks-status
#
#   Provides WTaskStatus structure for provided taskid.
#
# Topic: Synopsis
#
#   header: /gdc/md/<project>/tasks/<task-id>/status
#
#   GET - *
#     - (202 Accepted) <WTaskStatus> if status is RUNNING
#     - (200 Ok) <WTaskStatus> unless status is RUNNING
#     - (404 Not found) - % task not found
#
# Topic: Flags
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - supported since Hawk R59
#
# Topic: Description
#
#   https://confluence.gooddata.com/confluence/display/analysis/Migrate+MD+object+from+master+project+to+child
#

###############################################################################
# Group: Data Structures
###############################################################################

###############################################################################
# Structure: WTaskStatus
#
#   Task status and error messages structure.
#
# Topic: Specification
#
#   (start code)
#   WTaskStatus = < wTaskStatus : {
#     status : 'OK' | 'CANCELED' | 'ERROR' | 'RUNNING',
#     ( messages : [ Error ] )?,  % errors
#     ( poll : URISTRING )?       % Where to poll for next status (uri to self).
#   } >
#   (end)
#
# Topic: Description
#
#    For more info see https://confluence.gooddata.com/confluence/display/analysis/Project+Cloning
#

################################################################################
# Group: Info
################################################################################
#
# About: Owner(s)
#
#    Michal Jurosz
#
