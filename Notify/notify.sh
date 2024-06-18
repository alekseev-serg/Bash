#!/bin/sh

echo '''{
  "channel_id": "ikkewujomiy87p3nsgzhyduape",
  "message": ":osinit: New vesion of backend are available"
}
''' >data.json

curl -H "Authorization: Bearer htfd1dyrdb8yzd9tcwu96mutcw" -i -d "@data.json" https://mattermost.osinit.com/api/v4/posts
