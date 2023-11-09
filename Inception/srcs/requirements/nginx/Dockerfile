FROM debian:bullseye

RUN apt-get update -y 
RUN apt-get install -y nginx
RUN apt-get install -y curl
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lgirault.42.fr/UID=lgirault"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]