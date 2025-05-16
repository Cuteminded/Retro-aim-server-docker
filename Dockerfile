FROM golang:latest
ARG TARGETARCH
WORKDIR /go/src/
VOLUME [ "/go/src/" ]
EXPOSE 5190 5191 5192 5193 5194 5195 5196 5197 8080

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*
COPY boot.sh /usr/bin/CMBoot
RUN chmod +x /usr/bin/CMBoot
COPY settings.env /go/src/settings.env
COPY bin/${TARGETARCH}/retro_aim_server /go/retro_aim_server

ENV API_HOST=127.0.0.1
ENV API_PORT=8080
ENV ALERT_PORT=5194
ENV AUTH_PORT=5190
ENV BART_PORT=5195
ENV BOS_PORT=5191
ENV CHAT_NAV_PORT=5193
ENV CHAT_PORT=5192
ENV ADMIN_PORT=5196
ENV ODIR_PORT=5197
ENV DB_PATH=oscar.sqlite
ENV DISABLE_AUTH=true
ENV LOG_LEVEL=info
ENV OSCAR_HOST=127.0.0.1
ENV TOC_HOST=0.0.0.0
ENV TOC_PORT=9898

ENTRYPOINT ["CMBoot"]
