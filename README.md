# Mi primer proyecto multicontenedor con Docker
Proyecto multicontenedor que combina NGINX, WordPress y MariaDB para ofrecer un sitio de WordPress mediante un servidor HTTPS. 
La arquitectura del proyecto consiste en un reverse proxy de NGINX al que puede accederse mediante el puerto 443 y que conecta a través de la red interna
de Docker con WordPress por el puerto 9000 que interactua con la base de datos MariaDB por el puerto 3306 en la red interna de Docker. Esto garantiza un único punto de entrada exterior gestionado por NGINX.

Por motivos de seguridad las contraseñas de usuario y los certificados SSL no han sido subidos al repositorio. Invocando `make preprocess` se generarán dichas credenciales aleatoriamente en ficheros en la carpeta **./secrets** que podrás modificar para ajustarlos segun necesidad. Los certificados SSL son autogenerador, por lo que al acceder a la web puede aparecerte una alerta de sitio no seguro ya que no hay una entidad oficial que avale los certificados. Aun así no existe ningun riesgo.

También puedes modificar parametros como los usuarios y los nombres de las bases de datos en el fichero [./srcs/.env](./srcs/.env)

## Requisitos
- Docker
- Probado en sistemas Linux y Windows a través de WSL únicamente. Al haber scripts que usan comandos de UNIX es probable que
no funcione de manera nativa en Windows.

##  Despliegue
En la carpeta principal del proyecto ejecutar `make`. Tras completarse la intalación podrás acceder a tu sitio web
desde cualquier navegador con la ruta `https://localhost:443` o sustituyendo localhost por el `$DOMAIN_NAME` indicado en [./srcs/.env](./srcs/.env) si también has configurado el host correctamente para que gestione dicha url.

Si todo ha ido bien aparecerá una página alertando de que el sitio no es seguro dado que los certificados SSL, al haber sido
autogenerados, no están avalador por ninguna entidad certificadora. Clica sobre Avanzar y acceder a la web.  Verás la web
por defect de WordPress.

## Configuración
Para configurar el sitio de WordPress a tu gusto accede al portal de administrador haciendo log in con el `$WP_ADMIN` indicado en [./srcs/.env](./srcs/.env) y la contraseña del fichero **./secrets/wp_admin_password.txt** en la url `https://localhost:443/wp-login.php`.

¡LISTO! Configura y disfruta de tu sitio de WordPress.

## Apagado del contenedor
Si únicamente quieres pausar el contenedor pero conservar las configuraciones que hayas especificado en el paso anterior ejecuta el comando `make clean` desde el directorio raiz.

Si por el contrario también quieres borrar las configuraciones ejecuta `make fclean`.

