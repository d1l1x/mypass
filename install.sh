#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# --- Check parameters ---
if [ $# -ne 2 ]; then
    echo "Error: This script requires exactly 2 arguments." >&2
    echo "Usage: $0 <DOMAIN> <EMAIl>" >&2
    exit 1
fi

DOMAIN=$1
EMAIL=$2

echo DOMAIN=${DOMAIN} > .env
echo EMAIL=${EMAIL} >> .env

# Phase 1
docker compose -f docker-compose-cerbot.yml up -d nginx
docker compose -f docker-compose-cerbot.yml up certbot
docker compose -f docker-compose-cerbot.yml down

# some configurations for let's encrypt
curl -L --create-dirs -o etc/letsencrypt/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf
openssl dhparam -out etc/letsencrypt/ssl-dhparams.pem 2048
