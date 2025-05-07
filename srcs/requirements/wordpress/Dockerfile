# syntax=docker/dockerfile:1

FROM alpine:3.20 AS wpget
RUN apk add curl \
	&& curl https://wordpress.org/latest.zip --output wp.zip \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp-cli.phar

FROM alpine:3.20 AS final
COPY --from=wpget wp.zip /wp.zip
COPY --from=wpget --chmod=755 wp-cli.phar /usr/local/bin/wp
COPY --chmod=111 ./tools/wordpress_entrypoint.sh /wordpress_entrypoint.sh
RUN apk add \
	php83-fpm \
	php83-mysqli \
	php83-zip \
	php83-phar \
	php83-iconv \
	mariadb-client
RUN sed --in-place 's/listen = 127.0.0.1:9000/listen = wordpress:9000/' \
	/etc/php83/php-fpm.d/www.conf
ENTRYPOINT ["/wordpress_entrypoint.sh"]
EXPOSE 9000
