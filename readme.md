# Wealthbot Local Dev Environment

General disclaimer (TODO).

### Context

How do we get to this setup (todo)

### Micro services architecture

TODO

### Strangler pattern strategy

TODO

### Starting the environment

1. Clone this repo
2. Go into the services folder, and clone the code repos:

* Using HTTP:
  * `git clone https://github.com/wealthbot-io/wealthbot.git monolith`
  * `other code repos...`

* Using SSH:
  * `git clone git@github.com:wealthbot-io/wealthbot.git monolith`
  * `other code repos...`
    
3. Go to the root folder and run:

`docker-compose up -d`
