## [Original github repository by mk6i](https://github.com/mk6i/retro-aim-server)
**Retro AIM Server** is an open-source instant messaging server that makes classic AIM and ICQ clients work again.

## Start a ``Retro AIM Server`` server instance
```shell
docker run --name retro-aim-server -d cuteminded/retro-aim-server:latest
```

## 🔑 Environment Variables
- ``API_HOST`` Specifies the IP address or hostname that the management API binds to
- ``API_PORT`` The port that the management API service binds to.
- ``KERBEROS_PORT`` The port that the Kerberos server binds to.
- ``ALERT_PORT`` The port that the Alert service binds to.
- ``AUTH_PORT`` The port that the auth service binds to.
- ``BART_PORT`` The port that the BART service binds to.
- ``BOS_PORT`` The port that the BOS service binds to.
- ``CHAT_NAV_PORT`` The port that the chat nav service binds to.
- ``CHAT_PORT`` The port that the chat service binds to.
- ``ADMIN_PORT`` The port that the admin service binds to.
- ``ODIR_PORT`` The port that the ODir service binds to.
- ``DISABLE_AUTH`` Disable password check and auto-create new users at login time. Possible values: ``true``|``false``
- ``LOG_LEVEL`` Set logging granularity. Possible values: ``trace``|``debug``|``info``|``warn``|``error``.
- ``OSCAR_HOST`` The hostname that AIM clients connect to in order to reach OSCAR services
- ``TOC_HOST``Specifies the IP address or hostname that the TOC service binds to for incoming connections
- ``TOC_PORT`` The port that the TOC service binds to.

## 👤 Management API

The Management API provides functionality for administering the server (see [README](https://github.com/mk6i/retro-aim-server?tab=readme-ov-file#-management-api)). The following
shows you how to run these commands via the command line.

## Docker compose
```yml
services:
  aim:
    container_name: retro-aim-server
    image: cuteminded/retro-aim-server:latest
    restart: unless-stopped
    ports:
      - "5190-5197:5190-5197"
      - "1088:1088"
      - "8080:8080"
    environment:
      API_HOST: "127.0.0.1"
      API_PORT: "8080"
      KERBEROS_PORT: "1088"
      ALERT_PORT: "5194"
      AUTH_PORT: "5190"
      BART_PORT: "5195"
      BOS_PORT: "5191"
      CHAT_NAV_PORT: "5193"
      CHAT_PORT: "5192"
      ADMIN_PORT: "5196"
      ODIR_PORT: "5197"
      DISABLE_AUTH: "true"
      LOG_LEVEL: "info"
      OSCAR_HOST: "127.0.0.1"
      TOC_HOST: "0.0.0.0"
      TOC_PORT: "9898"
```
