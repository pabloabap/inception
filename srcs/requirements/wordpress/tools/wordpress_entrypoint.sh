#!/bin/sh

unzip -nq wp.zip;
mv -n /wordpress/* /wordpress/.* /web/ && rm -rf /wordpress;
sed -e "s/database_name_here/$MARIADB_DATABASE/" \
	-e "s/username_here/$MARIADB_USER/" \
	-e "s/password_here/$(cat $MARIADB_PASSWORD_FILE)/" \
	-e "s/localhost/$MARIADB_HOST/" \
	/web/wp-config-sample.php > /web/wp-config.php;
sed -i "/AUTH_KEY/{
	r $WP_CREDENTIALS_FILE
	:a
	N
	/NONCE_SALT/!ba
	d
}" /web/wp-config.php;
exec php-fpm83 -F;
