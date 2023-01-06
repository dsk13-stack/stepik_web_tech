#!/bin/bash

mkdir -p ~/web/{public,uploads,etc} && mkdir ~/web/public/{img,css,js} && mkdir -p ~/web/ask/qa
&& cp nginx.conf ~/web/etc/nginx.conf \
&& rm -r /etc/nginx/sites-enabled/default \
&& ln -s ~/web/etc/nginx.conf /etc/nginx/sites-enabled/nginx.conf \
&& nginx -t && /etc/init.d/nginx restart 
django-admin startproject ask ~/web/ask
~/web/ask/manage.py startapp qa ~/web/ask/qa
rm -r ~/web/ask/qa/views.py
cp views.py ~/web/ask/qa/views.py
rm -r ~/web/ask/ask/urls.py
cp urls.py ~/web/ask/ask/urls.py
sed -i "s/.*ALLOWED_HOSTS = .*/ALLOWED_HOSTS = ['*']/" ~/web/ask/ask/settings.py
gunicorn -b 0.0.0.0:8000 -c ~/web/ask/ask/wsgi.py wsgi:application