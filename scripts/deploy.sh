#!/bin/bash

set -e

yarn global add now@11.0.6
APP_URL=$(now --npm -t $NOW_TOKEN --public $PRIVATE_KEY -e BUILDKITE_TOKEN=@buildkite-token -e APP_ID=@APP_ID $WEBHOOK_SECRET -e NODE_ENV="production" -e PUBLISH_ARGS="dist")
now scale $APP_URL sfo 1 --token=$NOW_TOKEN
now alias set $APP_URL baseui-probot-app-workflow -t $NOW_TOKEN
now rm baseui-probot-app-workflow --safe -t $NOW_TOKEN -y
