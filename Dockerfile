FROM nginx:latest

# Remove default nginx configs.
RUN rm -f /etc/nginx/conf.d/*

#create logs
RUN mkdir /var/logs

# add nginx config
ADD conf /etc/nginx/conf.d

#add projects
ADD sites /var/www/html

# Set the current working directory
WORKDIR /var/www/html
