#!/bin/sh

COMPOSER="composer --working-dir=/var/www/symfony -n --ignore-platform-reqs --no-scripts"

# Ensure composer install on init...
$COMPOSER install

#php bin/console doctrine:database:create
php bin/console doctrine:schema:update
#php bin/console wealthbot:fixtures:load
#php bin/console wealthbot:security:price

# Init the service
php-fpm