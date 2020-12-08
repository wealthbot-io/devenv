@echo OFF

SETLOCAL ENABLEEXTENSIONS
SET me=%~n0
SET pwd=%~dp0

docker build -q --tag wealthbot_init ./env/init
docker run -v "%pwd%/:/var/wealthbot" wealthbot_init
