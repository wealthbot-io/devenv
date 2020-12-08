# Wealthbot Local Dev Environment

General disclaimer (TODO).

### Context

How do we get to this setup (todo)

### Micro services architecture

TODO

Service vs container, folder organization, etc...

### Services

TODO - Describe each service...

### Strangler pattern strategy

TODO

How we'll move from our current monolith, to a microservices architecture.

### Starting the environment

Requirements: You'll need docker and docker-compose installed on your OS.

1. Clone this repo
2. Run the init script located on the root folder (there is a batch version for Windows, and a bash version for 
   Linux/Mac). This will clone all repositories that are part of Wealthbot inside the services folder.
3. From the root folder, run:

`docker-compose up -d`

Give it time! This script returns once the containers are up, but the init scripts can take some minutes to run (in 
background) on the first execution. Before they're done, the env won't work.

To check the progress you can look on the logs inside the `state` folder. It will contain simplified logs for each 
service initialization.

If you didn't customize the ports, you'll see the services running on those addresses:

| Service    | Sub-service | Address:port    |
|------------|-------------|-----------------|
| monolith   | Main (web)  | 127.0.0.1:10001 |
| monolith   | MySQL       | 127.0.0.1:10002 |
| accounts   | Main (web)  | 127.0.0.1:12001 |
| accounts   | MySQL       | 127.0.0.1:12003 |
| accounts   | Redis       | 127.0.0.1:12004 |
| webapp     | Vue UI (cli)| 127.0.0.1:11001 |
| webapp     | Main (web)  | 127.0.0.1:11002 |
| localstack | Edge port   | 127.0.0.1:13001 |

### Environment variables

There is a list of environment variables that can be set to customize 
this development environment to your local env settings.

If you have some of the ports exposed by the env, already used on your
host OS, you can change the port number through an env variable.

Env variables are set on a `.env` file located on the root of this 
project. All variable have default values, so if your host system don't
have any incompatibility, it should run without setting anything.

All variables are prefixed with the service name.

You can find bellow a list of the accepted env variables:

* `WEBAPP_USE_VUE_UI` - Defines if the `webapp` service should run using vue-cli ui or command line.
If you set it to 1, you'll have to manually start the web app manually from the ui.
* `WEBAPP_VUE_CLI_UI_PORT` - This is the port used to access the vue-cli ui. Only accessible if `WEBAPP_USE_VUE_UI` 
  is set.
* `WEBAPP_HTTP_PORT` - This is the `webapp` main port, through where you can access the `webapp` from localhost.
