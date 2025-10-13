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
echo "[CM] Running Retro AIM Server v0.20.0"
echo "[CM] CPU Architecture: $(uname -m)"
echo "[CM] AIM Server Log Level: $LOG_LEVEL"
echo "[CM] Oscar listeners: $OSCAR_LISTENERS"
echo "[CM] API listeners: $API_LISTENER"
echo "[CM] TOC listeners: $TOC_LISTENERS"
echo "[CM] Auth disabled: $DISABLE_AUTH"

term() {
  echo "[CM] Stopping Retro AIM Server..."
  kill -TERM "$aim_server_pid" 2>/dev/null || true
}
trap term INT TERM

# Load settings.env if it exists, otherwise copy the default one
if [ -f /go/src/settings.env ]; then
    echo "[CM] Loading configuration..."
else
    echo "[CM] No configuration found, using defaults."
    cp /go/settings.env /go/src/settings.env
fi

# Start the server
echo "[CM] Starting Retro AIM Server..."
/go/retro_aim_server &
aim_server_pid=$!

# Import Bart Emoticons if the directory exists
sleep 5
if [ "$(ls -A /go/src/import_emoticons)" ]; then
  echo "[CM] Importing Bart Emoticons..."
  mkdir -p /go/src/aim_bart_emoticons > /dev/null 2>&1
  for file in /go/src/import_emoticons/*; do
    if [ -f "$file" ]; then
        echo "[CM] Importing $(basename "$file")..."
        mv "$file" /go/src/aim_bart_emoticons
        /usr/bin/import_bart -t emoticon_set -u http://$API_LISTENER /go/src/aim_bart_emoticons/$(basename "$file") >> /dev/null 2>&1
    fi
  done
    echo "[CM] Bart Emoticons import completed."
  else
    echo "[CM] No new emoticons found, skipping import."
    mkdir -p /go/src/import_emoticons > /dev/null 2>&1
fi

wait "$aim_server_pid"
exit $?
