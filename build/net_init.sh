NET=/home/docker_server_helloworld/network
cp -f $NET/supervisor/supervisord.conf /etc/supervisor/
supervisord -c /etc/supervisor/supervisord.conf
supervisorctl reread
supervisorctl update
supervisorctl start all

cp -f $NET/nginx/nginx.conf /etc/nginx/
nginx -c /etc/nginx/nginx.conf
nginx -s reload
/etc/init.d/nginx start

/bin/bash
