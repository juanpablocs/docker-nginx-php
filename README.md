# docker-nginx-php
Docker configuration for nginx with php5 fpm modular

##add new site
check folder **/conf/** and add new config file nginx. Example **mynewsite.pe.conf**
```
server {
  server_name          mynewsite.pe;
  root                 /var/www/html/mynewsite.pe;
  index                index.php
  error_log            /var/logs/mynewsite.pe_error.log;
  access_log           /var/logs/mynewsite.pe_access.log;

  location / {
    try_files $uri $uri/ /index.php$is_args$args;
  }

  location ~ \.php$ {
    fastcgi_pass phpserver:9000;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
  }

}
```
create new folder the project in **/sites/mynewsite.pe/** and add files.

add virtualhost in hosts **/etc/hosts**

```
127.0.0.1 mynewsite.pe
```


run docker
```
docker-compose up -d
```


