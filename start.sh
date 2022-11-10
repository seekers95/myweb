export PORT=${PORT-8080}
export UUID=${UUID-a52c166bccdc44348e9fbea6d017a1c3}

echo '
 {
    "inbounds": [
        {
            "type": "trojan",
            "listen": "::",
            "listen_port": '$PORT',
            "users": [
                {
                    "password": "'$UUID'"
                }
            ],
            "transport": {
                "type": "ws",
                "path": "/'$UUID'/trojan",
                "early_data_header_name": "Sec-WebSocket-Protocol"
            }
        }
    ]
}
' > config.json

chmod +x sing-box && ./sing-box run
