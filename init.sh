#!/bin/bash

mkdir -p ~/web/{public,uploads,etc} && mkdir ~/web/public/{img,css,js} \
&& cp nginx.conf ~/web/etc/nginx.conf \
&& rm -r /etc/nginx/sites-enabled/default \
&& ln -s ~/web/etc/nginx.conf /etc/nginx/sites-enabled/nginx.conf \
&& nginx -t && /etc/init.d/nginx restart \

