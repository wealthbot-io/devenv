#!/bin/sh

echo "[$(date)] Starting" > /var/state/monolith.php.state

COMPOSER="composer --working-dir=/var/www/symfony -n --ignore-platform-reqs --no-scripts"

# Ensure composer install on init...
if [ ! -d vendor ]; then
  echo "[$(date)] Running composer install" >> /var/state/monolith.php.state
  $COMPOSER install
fi

#php bin/console doctrine:database:create

echo "[$(date)] Initializing the schema" >> /var/state/monolith.php.state
php bin/console doctrine:schema:update
#php bin/console wealthbot:fixtures:load
#php bin/console wealthbot:security:price

# Init the service
echo "[$(date)] Ready" >> /var/state/monolith.php.state
php-fpm