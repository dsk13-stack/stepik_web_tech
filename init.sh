mkdir -p ./web/{public,uploads,etc} && mkdir ./web/public/{img,css,js}
cp hello.py ./web/hello.py
cp nginx.conf ./web/etc/nginx.conf
rm -r /etc/nginx/sites-enabled/default
ln -s ~/web/etc/nginx.conf /etc/nginx/sites-enabled/nginx.conf
nginx -t && nginx restart
cd ./web
gunicorn -b :8080 hello:wsgi_app
