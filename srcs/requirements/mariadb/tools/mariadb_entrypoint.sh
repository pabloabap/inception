#!/bin/sh

DATADIR="$(sed -n "/datadir/p" /etc/my.cnf.d/mariadb-server.cnf | \
	cut  -d= -f2 | xargs)"

if [ ! -d $DATADIR ] || [ -z "$(ls -A "$DATADIR")" ]; then
	mariadb-install-db --user=mysql;
fi
trap "mariadb-admin shutdown -u root -p$(cat $MARIADB_ROOT_PASSWORD_FILE)" \
	TERM;
mariadbd-safe &
PID=$!
until mariadb-admin ping --silent; do
	sleep 0.5;
done;
mariadb -e "
CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE; \
SET PASSWORD FOR \"root\"@\"localhost\" = PASSWORD(\"$(cat $MARIADB_ROOT_PASSWORD_FILE)\"); \
CREATE USER IF NOT EXISTS \"$MARIADB_USER\" IDENTIFIED BY \"$(cat $MARIADB_PASSWORD_FILE)\"; \
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO \"$MARIADB_USER\"; \
FLUSH PRIVILEGES; \
";
wait $PID;
