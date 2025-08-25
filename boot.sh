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
echo "[CM] Running Retro AIM Server v0.19.0"
echo "[CM] CPU Architecture: $(uname -m)"
echo "[CM] AIM Server Log Level: $LOG_LEVEL"
echo "[CM] Oscar listeners: $OSCAR_LISTENERS"
echo "[CM] API listeners: $API_LISTENER"
echo "[CM] TOC listeners: $TOC_LISTENERS"
echo "[CM] Auth disabled: $DISABLE_AUTH"
echo "[CM] Loading configuration..."
/go/retro_aim_server
