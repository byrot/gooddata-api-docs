# Copyright (C) 2007-2011, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: etltask
#

###############################################################################
# Topic: Description
#
#	Resource returning task status of ETL exec for a given queue id.

###############################################################################
# Section: Resources
###############################################################################

###############################################################################
# Resource: templates
#
# Topic: Synopsis
#
#>	/md/<project>/etltask/<id>
#
#	parameters:
#		none
#
#	GET  * -> TaskState
#   (start code)
#   TaskState = < taskState : {
#	status : 'WAIT'|'READY'|'RUNNING'|'OK'|'ERROR'|'PREPARING',
#	msg    : STRING
#   }>
#   (end)
#
#
# Topic: Flags
#
#	See <Flags Semantics> for details.
#
# scope - project-level
# access control - authorization required
# visibility - public
# state - draft
#
# Topic: Description
#
#    You post URI with project template meta on this resource. Unfotunatelly you cannot query error message
#    if the template load fails.
#
# Topic: Random Remarks
#
# Topic: Performance mini-status
#
#	{stable-xx, avg/median time}
#
# Topic: Example
#

###############################################################################
# Section: Example
###############################################################################
#
#   (start example)
# GET https://localhost/gdc/md/Project1/etltask/aam51dMVceSf
#
# ---
# taskState:
#   msg: 55 tables already exist in DWH, dwh_dm_az1uovci5mafvgk, dwh_dm_az1vovci5mafvgk, dwh_dm_az1wovci5mafvgk, dwh_dm_az1xovci5mafvgk, dwh_dm_az1yovci5mafvgk, ...  at /opt/common/lib/Executor/../Util/MDLoad.pm line 886.
#   status: ERROR
#     (end)
#

################################################################################
# Section: Info
################################################################################
#
# About: Owner(s)
#
#	Vladimir Makovsky
#
# About: Revision
#
#
# About: Copyright
#
#   *Copyright (C) 2007, GoodData Corporation* All rights reserved.
#
#   This program is not a free software. Let contact GoodData Corporation
#   (www.gooddata.com) in case to be informed about licensing conditions
#   for usage, modifications or distribution.
#
#   You may not (and you may not permit anyone else to) distribute, copy, modify,
#   create a derivative work of, reverse engineer, decompile or otherwise attempt
#   to extract the source code of this program or any part thereof, unless you have
#   been specifically allowed do so by GoodData Corporation in writing, or unless
#   this is expressly permitted or required by law.
#
#   GoodData Corporation *EXPRESSLY DISCLAIMS ALL WARRANTIES* and conditions
#   of any kind, whether express or implied, including, but not limited to
#   the implied warranties and all conditions of merchantability, fitness for
#   a particular purpose and non-infringement.
#
#   GoodData Corporation *SHALL NOT BE LIABLE* to you for any direct, indirect,
#   incidental, special consequential or exemplary damages which may be incurred
#	by you under any theory of liability. This shall include, but not be limited to,
#	any loss of profit (whether incurred directly or indirectly) or business
#	reputation, any loss of data suffered or other intangible loss;
