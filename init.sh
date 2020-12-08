#!/bin/sh

docker build --tag wealthbot_init ./env/init
docker run -v "$(pwd)/:/var/wealthbot" wealthbot_init