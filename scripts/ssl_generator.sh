# !/bin/sh

# Define  variables utilizadas en el script
SECRETS_DIR="$(dirname $(realpath $0))/../secrets"
SSL_CERTIFICATE="$SECRETS_DIR/ssl.crt"
SSL_KEY="$SECRETS_DIR/ssl.key"

# Crea el directorio `SECRETS_DIR` si no existe
if [ ! -d $SECRETS_DIR ]; then
	mkdir $SECRETS_DIR;
fi

# Crear el certificado y clave SSL si no existen
if [[ ! -f $SSL_CERTIFICATE ]] || [[ ! -f $SSL_KEY ]]; then
	openssl req -x509 -nodes -days 365 -newkey "rsa:2048" \
	 -out $SSL_CERTIFICATE -keyout $SSL_KEY \
	-subj "/C=ES/ST=Madrid/L=Madrid/O=pabad-ap/CN=pabad-ap@example.com" 2> /dev/null;
	echo "SSL certidicate doesn't exist. ssl.crt and ssl.key generated in /secrets"
fi
