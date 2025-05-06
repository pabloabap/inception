# syntax=docker/dockerfile:1

FROM alpine:3.20
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN apk add nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
EXPOSE 443
