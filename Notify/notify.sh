#!/bin/sh

echo '''{
  "channel_id": "woierjvoqi3rjgioq3jrgpo3kjrg",
  "message": "New vesion of backend are available"
}
''' >data.json

curl -H "Authorization: Bearer srgwrtgbijw4optrgkoorbkerg" -i -d "@data.json" https://mattermost.com/api/v4/posts
