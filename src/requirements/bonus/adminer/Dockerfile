FROM    debian:bullseye

RUN		apt-get update && apt-get -y install \
		curl \
		php7.4 \
		php-fpm \
		php-mysql

RUN		curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
			&& mkdir -p /var/www/html \
			&& mv ./adminer-4.8.1.php /var/www/html/index.php \
			&& adduser -u 82 -D -S -G www-data www-data

COPY	./conf/www.conf	/etc/php7.4/php-fpm.d/www.conf

EXPOSE	9000

CMD		["php-fpm7.4", "--nodaemonize"]