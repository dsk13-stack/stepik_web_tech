#!/bin/bash

mkdir -p ~/web/{public,uploads,etc}&&mkdir ~/web/public/{img,css,js}
cp hello.py ~/web/hello.py
cp nginx.conf ~/web/etc/nginx.conf
rm -r /etc/nginx/sites-enabled/default
ln -s ~/web/etc/nginx.conf /etc/nginx/sites-enabled/nginx.conf
nginx -t && nginx restart
gunicorn -b 0.0.0.0:8080 -c ~/web/python.py hello:wsgi_app
