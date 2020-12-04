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

1. Clone this repo
2. Go into the services folder, and clone each one of the source code
repositories, into the designed folder.
   
` * You can use the clone.sh script if your environment is prepared to 
clone from git using ssh. `

| Repository Address | Directory (under services)|
|--------------------|---------------------------|
| https://github.com/wealthbot-io/wealthbot | monolith |
| https://github.com/wealthbot-io/webapp | webapp |
    
3. Go to the root folder and run:

`docker-compose up -d`

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
