#!/bin/sh

npm install

if [ ${USE_VUE_UI} -gt 0 ]; then
  vue ui -H 0.0.0.0 -p 8000 --quiet --headless
else
  npm run serve
fi;

