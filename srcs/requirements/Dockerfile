# syntax=docker/dockerfile:1

FROM alpine:3.20 AS ...
WORKDIR ...
ENV ...
RUN cmd before image build
COPY srcPath contPath
RUN cmd before image build
EXPOSE puerto:wq
COPY . .
# Comando por defecto
CMD [ ..., ..., ...]
# Comando incial obligatorio, opcional
ENTRYPOINT [..., ..., ...]
ENTRYPOINT cmd param param
