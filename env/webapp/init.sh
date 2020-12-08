#!/bin/sh

echo "[$(date)] Starting" > /var/state/webapp.state

if [ ! -d node_modules ]; then
  echo "[$(date)] Running npm install" >> /var/state/webapp.state
  npm install
fi

echo "[$(date)] Ready" >> /var/state/webapp.state

if [ ${USE_VUE_UI} -gt 0 ]; then
  vue ui -H 0.0.0.0 -p 8000 --quiet --headless
else
  npm run serve
fi;

