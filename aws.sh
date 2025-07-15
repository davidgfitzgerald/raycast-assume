#!/bin/bash

# Raycast AWS login script.
# 
# Simply login to an AWS service and account (profile)
# through raycast. Uses assume (by granted) to login.

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title aws
# @raycast.mode compact
# @raycast.argument1 { "type": "dropdown", "placeholder": "Service", "default": "console", "data": [{"title": "", "value": ""}, {"title": "console", "value": "console"}, {"title": "acm", "value": "acm"}, {"title": "aos", "value": "aos"}, {"title": "apigateway", "value": "apigateway"}, {"title": "apigw", "value": "apigw"}, {"title": "appsync", "value": "appsync"}, {"title": "athena", "value": "athena"}, {"title": "backup", "value": "backup"}, {"title": "bedrock", "value": "bedrock"}, {"title": "billing", "value": "billing"}, {"title": "c9", "value": "c9"}, {"title": "ce", "value": "ce"}, {"title": "cf", "value": "cf"}, {"title": "cfn", "value": "cfn"}, {"title": "cloudformation", "value": "cloudformation"}, {"title": "cloudmap", "value": "cloudmap"}, {"title": "cloudwatch", "value": "cloudwatch"}, {"title": "codeartifact", "value": "codeartifact"}, {"title": "codecommit", "value": "codecommit"}, {"title": "codedeploy", "value": "codedeploy"}, {"title": "codepipeline", "value": "codepipeline"}, {"title": "codesuite", "value": "codesuite"}, {"title": "config", "value": "config"}, {"title": "controltower", "value": "controltower"}, {"title": "ct", "value": "ct"}, {"title": "cw", "value": "cw"}, {"title": "ddb", "value": "ddb"}, {"title": "dms", "value": "dms"}, {"title": "dx", "value": "dx"}, {"title": "dynamodb", "value": "dynamodb"}, {"title": "eb", "value": "eb"}, {"title": "ebs", "value": "ebs"}, {"title": "ec2", "value": "ec2"}, {"title": "ecr", "value": "ecr"}, {"title": "ecs", "value": "ecs"}, {"title": "eks", "value": "eks"}, {"title": "eventbridge", "value": "eventbridge"}, {"title": "events", "value": "events"}, {"title": "gd", "value": "gd"}, {"title": "grafana", "value": "grafana"}, {"title": "iam", "value": "iam"}, {"title": "kms", "value": "kms"}, {"title": "l", "value": "l"}, {"title": "lambda", "value": "lambda"}, {"title": "mwaa", "value": "mwaa"}, {"title": "orgs", "value": "orgs"}, {"title": "organizations", "value": "organizations"}, {"title": "param", "value": "param"}, {"title": "r53", "value": "r53"}, {"title": "ram", "value": "ram"}, {"title": "rds", "value": "rds"}, {"title": "redshift", "value": "redshift"}, {"title": "route53", "value": "route53"}, {"title": "s3", "value": "s3"}, {"title": "sagemaker", "value": "sagemaker"}, {"title": "scrh", "value": "scrh"}, {"title": "scrm", "value": "scrm"}, {"title": "secretsmanager", "value": "secretsmanager"}, {"title": "securityhub", "value": "securityhub"}, {"title": "ses", "value": "ses"}, {"title": "sfn", "value": "sfn"}, {"title": "sm", "value": "sm"}, {"title": "sns", "value": "sns"}, {"title": "ssm", "value": "ssm"}, {"title": "sso", "value": "sso"}, {"title": "states", "value": "states"}, {"title": "stepfn", "value": "stepfn"}, {"title": "tra", "value": "tra"}, {"title": "trustedadvisor", "value": "trustedadvisor"}, {"title": "vpc", "value": "vpc"}, {"title": "waf", "value": "waf"}, {"title": "wafv2", "value": "wafv2"}]}
# @raycast.argument2 { "type": "dropdown", "placeholder": "Profile", "default": "pddev", "data": [!!! OVERWRITE THIS WITH profiles.json !!!] }

# Optional parameters:
# @raycast.icon aws-logo.png

# Documentation:
# @raycast.author David Fitzgerald
# @raycast.authorURL https://github.com/davidgfitzgerald

# If using Chrome, if you want to open a default browser
# profile, pass --browser-profile as demonstrated below
# as per:
# 
# https://github.com/fwdcloudsec/granted/issues/886
#
# . assume --browser-profile Work -s $1 $2 &>/dev/null
. assume -s $1 $2 &>/dev/null
