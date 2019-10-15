#!/bin/bash

set -e

yarn global add now
APP_URL=$(now -t $NOW_TOKEN --public -e APP_ID=$APP_ID -e PRIVATE_KEY=$PRIVATE_KEY -e BUILDKITE_TOKEN=$BUILDKITE_TOKEN -e WEBHOOK_SECRET=$WEBHOOK_SECRET -e NODE_ENV="production" -e PUBLISH_ARGS="dist")
now scale $APP_URL sfo 1 --token=$NOW_TOKEN
now alias set $APP_URL baseui-probot-app-workflow -t $NOW_TOKEN
now rm baseui-probot-app-workflow --safe -t $NOW_TOKEN -y
