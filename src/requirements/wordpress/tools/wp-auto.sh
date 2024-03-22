sed -i  "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf
echo    "clear_env = no" >> /etc/php/7.4/fpm/pool.d/www.conf

if [ -f /var/www/html/wp-config.php ]
then
	echo "wordpress already downloaded"
else

	sleep 10

	wp core download --allow-root --path=/var/www/html

	cd /var/www/html

	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root --locale=es_ES

	echo "define( 'CONCATENATE_SCRIPTS', false );" >> wp-config.php

	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

	wp theme install "twentytwenty-two" --activate --allow-root

	#REDIS

	wp config set WP_REDIS_HOST redis --allow-root
	
	wp config set WP_REDIS_PORT 6379 --allow-root

	wp config set WP_CAHCHE_KEY_SALT $DOMAIN_NAME --allow-root

	wp config set WP_REDIS_CLIENT phpredis --allow-root

	wp plugin install redis-cache --activate --allow-root

	wp plugin update --all --allow-root
	
	wp redis enable --allow-root

	sleep 5

fi

/usr/sbin/php-fpm7.4 -F
