# syntax=docker/dockerfile:1

FROM alpine:3.20 AS wpget
RUN apk add curl \
	&& curl https://wordpress.org/latest.zip --output wp.zip

FROM alpine:3.20 AS final
COPY --from=wpget wp.zip /wp.zip
RUN apk add php83-fpm php83-mysqli \
	&& unzip -oq wp.zip
RUN sed --in-place 's/listen = 127.0.0.1:9000/listen = wordpress:9000/' \
	/etc/php83/php-fpm.d/www.conf
VOLUME ["/wordpress"]
#FROM debian:11
#FROM alpine:3.20 AS ...
#WORKDIR ...
#ENV ...
#RUN cmd before image build
#EXPOSE puerto:
#COPY . .
## Comando por defecto
#CMD [ ..., ..., ...]
## Comando incial obligatorio, opcional
#ENTRYPOINT [..., ..., ...]
#ENTRYPOINT cmd param param
ENTRYPOINT ["php-fpm83", "-F"]
#EXPOSE 443
