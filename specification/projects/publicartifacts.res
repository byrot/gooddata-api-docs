##############################################################################
# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
##############################################################################
#
# Section: PublicArtifacts
#
###############################################################################
#
# Group: Description
# PublishedArtifact resource is used for public exposing of project's artifacts (the 
# project itself, dashboards, reports). An artifact is exposed by a public access code
# that can be used in the login structure instead of username and password.
# 
# This resource can be used for public access code creation, renewal and read.
#
###############################################################################
# Group: Resource(s)
#   header: /projects/<projectId>/publicartifacts/
#
#           POST PublicProjectArtifact           % used for PublicProjectArtifact creation (canManagePublicAccessCode required)
#              - (200 Ok) PublicProjectArtifact
#              - (404 Not found)
#           GET -
#              - (200 Ok) PublicProjectArtifacts % collection of PublicProjectArtifact (canSeePublicAccessCode required)
#
#  header: /projects/<projectId>/publicartifacts/<secret>
#
#           GET -
#              - (200 Ok) PublicProjectArtifact % used for PublicProjectArtifact read (canSeePublicAccessCode required)
#              - (404 Not found)
#           DELETE                          % used for access code revocation (canManagePublicAccessCode required)
#              - (204 Ok)
#
#
###############################################################################
# Group: Security Consideration
#
# canSeePublicAccessCode - users with this permission may READ PublicProjectArtifact structure
# canManagePublicAccessCode - users with this permission may WRITE or DELETE PublicProjectArtifact structure
#
###############################################################################
# Group: Data Structures
#
#  (start code)
#
#  PublicProjectArtifacts =<publicProjectArtifacts: {
#    items: [PublicProjectArtifact]      % List of public access codes
#  }>
#
#  PublicProjectArtifact = <publicProjectArtifact: {
#    (secret: TEXT)?,                     % the publicAccessCode itself
#    artifact: PublicProjectArtifactSpec,
#    (links: {
#        self: URISTRING,             % the link to PublicProjectArtifact
#        publicArtifact: URISTRING % the URI of public artefact e.g. project, dashboard, report.
#      })?
#    }>
#
#  PublicProjectArtifactSpec = project | URI
#
#  (end)
#
###############################################################################
# Group: Mock-up
#
#   header: Create a PublicAccessCode.
#   (start example)
#    POST
#    https://secure.gooddata.com/gdc/projects/FoodMartDemo/publicartifacts
#    Request
#    BODY: {"publicProjectArtifact":{"artifact":"project"}} 
#    Response
#    HEAD: 200
#    BODY: {"publicProjectArtifact":{"secret":"XYZ","artifact":"project","links":{"self":"/gdc/projects/FoodMartDemo/publicartifacts/XYZ","publicArtifact":"/gdc/projects/FoodMartDemo"}}}
#   (end)
#
###############################################################################
# Group: Mock-up
#
#   header: PublicAccessCode renewal (3 steps)
#   (start example)
#    GET
#    https://secure.gooddata.com/gdc/projects/FoodMartDemo/publicartifacts
#    Response
#    HEAD: 200 
#    BODY:{"publicProjectArtifacts":{"items":[{"publicProjectArtifact":{"secret":"XYZ","artifact":"project","links":"self":"/gdc/projects/FoodMartDemo/publicartifacts/XYZ","publicArtifact":"/gdc/projects/FoodMartDemo"}}}]}} 
#
#    DELETE
#    https://secure.gooddata.com/gdc/projects/FoodMartDemo/publicartifacts/XYZ
#    Response 204
#
#    POST
#    https://secure.gooddata.com/gdc/projects/FoodMartDemo/publicartifacts
#    Request
#    BODY: {"publicProjectArtifact":{"artifact":"project"}} 
#    Response
#    HEAD: 200
#    BODY: {"publicProjectArtifact":{"secret":"BFL","artifact":"project","links":{"self":"/gdc/projects/FoodMartDemo/publicartifacts/BFL","publicArtifact":"/gdc/projects/FoodMartDemo"}}}
#  (end)
#
###############################################################################
# Group: Mock-up
#
#   header: PublicAccessCode read
#   (start example)
#    GET
#    https://secure.gooddata.com/gdc/projects/FoodMartDemo/publicartifacts/XYZ 
#    Response
#    HEAD: 200 
#    BODY: {"publicProjectArtifact":{"secret":"XYZ","artifact":"project","links":{"self":"/gdc/projects/FoodMartDemo/publicartifacts/XYZ","publicArtifact":"/gdc/projects/FoodMartDemo"}}}
#
#   (end)  
