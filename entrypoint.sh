#!/bin/sh
cat << EOF > /usr/local/etc/v2ray/config.json
{
  "dns": {
    "servers": [
       "https+local://1.1.1.1/dns-query",
       "localhost"
    ]
  },
  "inbounds": [
  {
    "port": 18142
    "listen":"127.0.0.1",
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "239bd8ce-fc92-11ea-adc1-0242ac120002",
          "alterId": 0       
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
      "path": "/ws"
      }     
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
# start nginx
nginx
# Run V2Ray
v2ray -config /usr/local/etc/v2ray/config.json
