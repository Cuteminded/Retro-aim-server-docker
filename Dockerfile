# syntax=docker/dockerfile:1
# check=skip=SecretsUsedInArgOrEnv
FROM golang:latest
ARG TARGETARCH
WORKDIR /go/src/
VOLUME [ "/go/src/" ]
EXPOSE 1088 5190 5191 5192 5193 5194 5195 5196 5197 8080

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*
COPY boot.sh /usr/bin/CMBoot
RUN chmod +x /usr/bin/CMBoot
COPY settings.env /go/src/settings.env
COPY bin/${TARGETARCH}/retro_aim_server /go/retro_aim_server

ENV OSCAR_LISTENERS=LOCAL://0.0.0.0:5190
ENV OSCAR_ADVERTISED_LISTENERS_PLAIN=LOCAL://127.0.0.1:5190
ENV TOC_LISTENERS=0.0.0.0:9898
ENV API_LISTENER=127.0.0.1:8080
ENV DB_PATH=oscar.sqlite
ENV DISABLE_AUTH=true
ENV LOG_LEVEL=info

ENTRYPOINT ["CMBoot"]
