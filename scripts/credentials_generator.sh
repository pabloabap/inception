# !/bin/sh

# Define  variables utilizadas en el script
SECRETS_DIR="$(dirname $(realpath $0))/../secrets"
DB_PASSWORD="$SECRETS_DIR/db_password.txt"
DB_ROOT_PASSWORD="$SECRETS_DIR/db_root_password.txt"
CREDENTIALS="$SECRETS_DIR/credentials.txt"

# Crea el directorio `SECRETS_DIR` si no existe
if [ ! -d $SECRETS_DIR ]; then
	mkdir $SECRETS_DIR;
fi

# Crear contraseñas y credenciales si lo estan definidos los ficheros
if [ ! -f $DB_PASSWORD ]; then
	openssl rand -base64 12 > $DB_PASSWORD;
	echo "Random db_password.txt generated in /secrets";
fi

if [ ! -f $DB_ROOT_PASSWORD ]; then
	openssl rand -base64 12 > $DB_ROOT_PASSWORD;
	echo "Random db_root_password.txt generated in /secrets";
fi

if [ ! -f $CREDENTIALS ]; then
	touch $CREDENTIALS;
	echo "credentials.txt file generated in /secrets";
fi
