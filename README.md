# Mi primer proyecto multicontenedor con Docker
Proyecto multicontenedor que combina NGINX, WordPress y MariaDB para ofrecer un sitio de WordPress mediante un servidor HTTPS. 
La arquitectura del proyecto consiste en un reverse proxy de NGINX al que puede accederse mediante el puerto 443 y que conecta a través de la red interna
de Docker con WordPress por el puerto 9000 que interactua con la base de datos MariaDB por el puerto 3306 en la red interna de Docker. Esto garantiza un único punto de entrada exterior gestionado por NGINX.

Por motivos de seguridad las contraseñas de usuario y los certificados SSL no han sido subidos al repositorio. Invocando `make preprocess` se generarán dichas credenciales aleatoriamente en ficheros en la carpeta **./secrets** que podrás modificar para ajustarlos segun necesidad.
También puedes modificar parametros como los usuarios y los nombres de las bases de datos en el fichero [./srcs/.env](./srcs/.env)
