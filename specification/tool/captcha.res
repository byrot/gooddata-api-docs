# Copyright (C) 2007-2010, GoodData(R) Corporation. All rights reserved.
###############################################################################
#
#   Section: tool/captcha
#

###############################################################################
# Group: Description
#
#   GoodData captcha service resource.
#

###############################################################################
# Group: Resource(s)
#
#   header: /gdc/tool/captcha
#         GET - *
#		-> (200 OK) Captcha
#

###############################################################################
# Group: Data Structures
#
#   header: Captcha
#
#   (start code)
#    Captcha = < captcha : {
#       captchaPic : URISTRING,
#       (captchaString : STRING)?,
#       verifyCaptcha : STRING
#    }>
#   (end)
