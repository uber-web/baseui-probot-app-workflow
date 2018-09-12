#!/bin/bash

set -e

yarn global add now@11.0.6
APP_URL=$(now --npm -t $NOW_TOKEN --public -e PRIVATE_KEY=@private-key -e APP_ID=@app-id -e WEBHOOK_SECRET=@webhook-secret -e NODE_ENV="production")
now scale $APP_URL sfo 1 --token=$NOW_TOKEN
now alias set $APP_URL baseui-probot-app-workflow -t $NOW_TOKEN
now rm baseui-probot-app-workflow --safe -t $NOW_TOKEN -y
