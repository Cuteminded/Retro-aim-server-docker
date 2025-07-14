#!/bin/bash
cd /go/src
cat << "EOF"
 ██████╗██╗   ██╗████████╗███████╗███╗   ███╗██╗███╗   ██╗██████╗ ███████╗██████╗ 
██╔════╝██║   ██║╚══██╔══╝██╔════╝████╗ ████║██║████╗  ██║██╔══██╗██╔════╝██╔══██╗
██║     ██║   ██║   ██║   █████╗  ██╔████╔██║██║██╔██╗ ██║██║  ██║█████╗  ██║  ██║
██║     ██║   ██║   ██║   ██╔══╝  ██║╚██╔╝██║██║██║╚██╗██║██║  ██║██╔══╝  ██║  ██║
╚██████╗╚██████╔╝   ██║   ███████╗██║ ╚═╝ ██║██║██║ ╚████║██████╔╝███████╗██████╔╝
 ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═════╝ 
EOF
echo "[CM] Running Retro AIM Server v0.18.0"
echo "[CM] CPU Architecture: $(uname -m)"
echo "[CM] AIM Server Log Level: $LOG_LEVEL"
echo "[CM] Oscar Host: $OSCAR_HOST"
echo "[CM] API Host: $API_HOST:$API_PORT"
echo "[CM] TOC Host: $TOC_HOST:$TOC_PORT"
echo "[CM] Loading configuration..."
/go/retro_aim_server
