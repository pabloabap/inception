#!/bin/sh

set -x;

unzip -nq wp.zip;
mv -n /wordpress/* /wordpress/.* /web/ && rm -rf /wordpress wp.zip;
wp config create --path="/web" --dbname="$MARIADB_DATABASE" \
	--dbuser="$MARIADB_USER" --dbpass="$(cat $MARIADB_PASSWORD_FILE)" \
	--dbhost="$MARIADB_HOST";
wp db create --path=/web;
wp core install --path=/web --url="$DOMAIN_NANE" --title="$WP_TITLE" \
	--admin_user="$WP_ADMIN" \
	--admin_password="$(cat $MARIADB_ROOT_PASSWORD_FILE)" \
	--admin_email="$WP_ADMIN_EMAIL"
wp option update siteurl "https://$DOMAIN_NAME" --path=/web
wp option update home "https://$DOMAIN_NAME" --path=/web

set +x;

exec php-fpm83 -F;
