Proyecto multicontenedor que combina NGINX, WordPress y MariaDB para ofrecer un servidor HTTPS. 
La arquitectura del proyecto consiste en un reverse proxy de NGINX al que puede accederse mediante el puerto 443 y que conecta a través de la red interna
de Docker con WordPress por el puerto 9000 e interactua con la base de datos MariaDB por el puerto 3060 en la red interna de Docker. Esto garantiza un único punto de entrada exterior gestionado por NGINX.
