FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php7.4 php-fpm php-mysql

# wp-cli pour remplir les infoword press en ligne de commande
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN apt-get update && apt-get install -y default-mysql-client
RUN apt-get install -y mariadb-client
RUN wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/html && \
    tar -xzf /var/www/html/wordpress-6.1.1.tar.gz -C /var/www/html && \
    rm /var/www/html/wordpress-6.1.1.tar.gz

RUN chown -R www-data:www-data /var/www/*

EXPOSE 9000

COPY ./tools/wpscript.sh ./
RUN chmod +x ./wpscript.sh

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["bash", "./wpscript.sh"]