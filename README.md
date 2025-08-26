## [Original github repository by mk6i](https://github.com/mk6i/retro-aim-server)
**Retro AIM Server** is an open-source instant messaging server that makes classic AIM and ICQ clients work again.

## Start a ``Retro AIM Server`` server instance
```shell
docker run --name retro-aim-server -d cuteminded/retro-aim-server:latest
```

## 👤 Management API
The Management API provides functionality for administering the server (see [README](https://github.com/mk6i/retro-aim-server?tab=readme-ov-file#-management-api)). The following
shows you how to run these commands via the command line.

## 🔑 Environment Variables
### `OSCAR_LISTENERS`
Defines the network listeners for core OSCAR services. Allows clients to connect from multiple networks (LAN, WAN, etc.).
  `NAME://HOSTNAME:PORT` (comma-separated for multiple entries)  
  ```env
  OSCAR_LISTENERS=LOCAL://0.0.0.0:5190
  ```
---
### `OSCAR_ADVERTISED_LISTENERS_PLAIN`
Hostnames and ports advertised by the server for OSCAR clients. These are the addresses clients actually use to connect.
  `NAME://HOSTNAME:PORT` (must match `OSCAR_LISTENERS`)  
  ```env
  OSCAR_ADVERTISED_LISTENERS_PLAIN=LOCAL://127.0.0.1:5190
  ```
---
### `TOC_LISTENERS`
Network listeners for the TOC protocol service. `HOSTNAME:PORT` (comma-separated for multiple listeners)  
  ```env
  TOC_LISTENERS=0.0.0.0:9898
  ```
---
### `API_LISTENER`
Listener for the management API. Only **one** listener can be defined. (Default: `127.0.0.1:8080` restricts to local machine only).
  ```env
  API_LISTENER=127.0.0.1:8080
  ```
---
### `DB_PATH`
Path to the SQLite database file. If the file doesn’t exist, it will be auto-created.
  ```env
  DB_PATH=oscar.sqlite
  ```
---
### `DISABLE_AUTH`
When set to `true`, disables password checks and auto-creates new users at login. Useful for **development and testing only**.
  ```env
  DISABLE_AUTH=true
  ```
---
### `LOG_LEVEL`
Sets logging verbosity.  
**Options:** `trace`, `debug`, `info`, `warn`, `error`  
  ```env
  LOG_LEVEL=info
  ```

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
      - OSCAR_LISTENERS: 'LOCAL://0.0.0.0:5190'
      - OSCAR_ADVERTISED_LISTENERS_PLAIN: 'LOCAL://127.0.0.1:5190'
      - TOC_LISTENERS: '0.0.0.0:9898'
      - API_LISTENER: '127.0.0.1:8080'
      - DB_PATH: 'oscar.sqlite'
      - DISABLE_AUTH: 'true'
      - LOG_LEVEL: 'info'
```
