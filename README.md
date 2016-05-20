# docker-nginx-php
Docker configuration for nginx with php5 fpm modular

##add new site
check folder **/conf/** and add new config file nginx. Example **mynewsite.pe.conf**
```
server {
  server_name          mynewsite.pe;
  root                 /var/www/html/mynewsite.pe;
  error_log            /var/logs/mynewsite.pe_error.log;
  access_log           /var/logs/mynewsite.pe_access.log;

  location ~ \.php$ {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass phpserver:9000;
    fastcgi_index index.php;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_param PATH_INFO $fastcgi_path_info;
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


