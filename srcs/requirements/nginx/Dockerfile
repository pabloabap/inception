# syntax=docker/dockerfile:1

FROM alpine:3.20
#FROM debian:11
#FROM alpine:3.20 AS ...
#WORKDIR ...
#ENV ...
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN apk add nginx
#RUN cmd before image build
#EXPOSE puerto:
#COPY . .
## Comando por defecto
#CMD [ ..., ..., ...]
## Comando incial obligatorio, opcional
#ENTRYPOINT [..., ..., ...]
#ENTRYPOINT cmd param param
ENTRYPOINT ["nginx", "-g", "daemon off;"]
EXPOSE 443
