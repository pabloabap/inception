# syntax=docker/dockerfile:1

FROM alpine:3.20
COPY ./conf /etc/
COPY ./tools/mariadb_entrypoint.sh /init-database.sh
RUN apk add mariadb mariadb-client
RUN chmod 111 /init-database.sh 
CMD ["/init-database.sh"]
HEALTHCHECK --start-period=5s --interval=2s --retries=6 CMD mariadb-admin ping
EXPOSE 3306
