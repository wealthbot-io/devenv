#!/bin/sh

echo "[$(date)] Starting" > /var/state/accounts.php.state

COMPOSER="composer --working-dir=/var/www -n --ignore-platform-reqs"

if [ ! -d vendor ]; then
  echo "[$(date)] Running composer install" >> /var/state/accounts.php.state
  $COMPOSER install;
fi

if [ ! -d node_modules ]; then
  echo "[$(date)] Running npm install" >> /var/state/accounts.php.state
  npm install;
fi

if [ ! -f public/js/app.js ]; then
  echo "[$(date)] Running npm run dev (compiling assets)" >> /var/state/accounts.php.state
  npm run dev;
fi

if [ ! -f .env ]; then
  echo "[$(date)] Copy .env" >> /var/state/accounts.php.state
  cp .env.example .env
fi

if [ $(cat .env | grep "^APP_KEY=..." | wc -l) -eq 0 ]; then
  echo "[$(date)] Generating keys" >> /var/state/accounts.php.state
  php artisan key:generate
fi

echo "[$(date)] Running migrations" >> /var/state/accounts.php.state
# Try until the database is up
while :
do
	if php artisan migrate -q; then
		break
	fi
	echo "Waiting on database"
	sleep 1
done


echo "[$(date)] Linking public storage" >> /var/state/accounts.php.state
php artisan storage:link

if [ ! -f storage/oauth-private.key ]; then
  echo "[$(date)] Generating passport keys" >> /var/state/accounts.php.state
  php artisan passport:keys
fi

echo "[$(date)] Ready" >> /var/state/accounts.php.state

php-fpm