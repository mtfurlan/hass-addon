#!/usr/bin/env bash

cert=/etc/nginx/my-site.com.crt
cert_key=/etc/nginx/my-site.com.key

cd /tmp
openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
openssl rsa -passin pass:x -in server.pass.key -out "$cert_key"
rm server.pass.key
openssl req -new -key "$cert_key" -out server.csr \
    -subj "/C=UK/ST=Warwickshire/L=Leamington/O=OrgName/OU=IT Department/CN=example.com"
openssl x509 -req -days 365 -in server.csr -signkey "$cert_key" -out "$cert"


echo "starting nginx..."

nginx -g 'daemon off;'
