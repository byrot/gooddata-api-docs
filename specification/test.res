# Copyright (C) 2007-2012, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: test
#

###############################################################################
# Group: Description
#    Resource for getting users info
#    It accepts user profile uris and will return user profile details for them.
#    In details will be email, firstname and lastname.
#
#

###############################################################################
# Group: Resource(s)
#
#    % without 'testSuite' parameter smoke tests should be executed
#    header: /test(?testSuite=healthChecks|smokeTests(&project_name=<project>)?)?
#
#    GET
#    - (200 OK) <SelfTestResults>             % we've got results
#

###############################################################################
# Group: Data Structures
#
#
#
#   %% This structure contains results of all executed smoke-tests / health-checks
#   (start code)
#   SelfTestResults = < testResults : {
#                items: [TestResult]
#   }>
#   (end)
#
#   %% This structure contains results of smoke-test / health-check execution
#   (start code)
#   TestResult = < testResult: {
#                testName: STRING,
#                result: 'OK' | 'FAILED',
#                messages : {
#                      errorMessages      : [STRING],
#                      warnMessages       : [STRING],
#                      infoMessages       : [STRING]
#   }}>
#   (end)
