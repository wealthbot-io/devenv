#!/bin/sh

# Initialize the localstack service to simulate AWS services
if  [ ! -d "/var/wealthbot/env/localstack/storage/data" ]; then
    cp -r /var/wealthbot/env/localstack/init/* /var/wealthbot/env/localstack/storage
fi

# Initialize the classic Wealthbot Application
if [ ! -d "/var/wealthbot/services/monolith" ]; then
    git clone https://github.com/wealthbot-io/wealthbot.git /var/wealthbot/services/monolith;
fi

# Initialize the accounts/auth service
if [ ! -d "/var/wealthbot/services/accounts" ]; then
    git clone https://github.com/wealthbot-io/accounts.git /var/wealthbot/services/accounts;
fi

# Initialize the webapp/SPA/UI
if [ ! -d "/var/wealthbot/services/webapp" ]; then
    git clone https://github.com/wealthbot-io/webapp.git /var/wealthbot/services/webapp;
fi
