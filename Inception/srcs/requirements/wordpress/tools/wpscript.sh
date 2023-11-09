#!/bin/bash
#set -eux

cd /var/www/html/wordpress

if ! wp core is-installed; then
wp config create	--allow-root --dbname=${SQL_DATABASE} \
			--dbuser=${SQL_USER} \
			--dbpass=${SQL_PASSWORD} \
			--dbhost=${SQL_HOST} \
			--url=https://${DOMAIN_NAME};

wp core install	--allow-root \
			--url=https://${DOMAIN_NAME} \
			--title=${SITE_TITLE} \
			--admin_user=${ADMIN_USER} \
			--admin_password=${ADMIN_PASSWORD} \
			--admin_email=${ADMIN_EMAIL};

wp user create		--allow-root \
			${USER1_LOGIN} ${USER1_MAIL} \
			--role=author \
			--user_pass=${USER1_PASS} ;

wp cache flush --allow-root

wp language core install fr_FR --activate

# Faire en sorte que les liens soit plus comprehensible em mettant le nom a l'interieur
wp rewrite structure '/%postname%/'

fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

# lance php fastcgi en mode permanent 
exec /usr/sbin/php-fpm7.4 -F