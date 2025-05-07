#!/bin/sh

unzip -nq wp.zip;
mv -n /wordpress/* /wordpress/.* /web/ && rm -rf /wordpress wp.zip;
wp config create --path="/web" --dbname="$MARIADB_DATABASE" \
	--dbuser="$MARIADB_USER" --dbpass="$(cat $MARIADB_PASSWORD_FILE)" \
	--dbhost="$MARIADB_HOST";
wp db create --path="/web";
wp core install --path="/web" --url="$DOMAIN_NAME" --title="$WP_TITLE" \
	--admin_user="$WP_ADMIN" \
	--admin_password="$(cat $WP_ADMIN_PASSWORD_FILE)" \
	--admin_email="$WP_ADMIN_EMAIL";
wp user create --path="/web" $WP_USER $WP_USER_EMAIL --role="subscriber" \
	--user_pass=$(cat $WP_USER_PASSWORD_FILE);
wp option update siteurl "https://$DOMAIN_NAME" --path="/web";
wp option update home "https://$DOMAIN_NAME" --path="/web";

exec php-fpm83 -F;
