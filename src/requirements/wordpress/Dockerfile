FROM    debian:bullseye

RUN	apt-get update && apt-get -y install \
		curl \
		php7.4 \
		php-fpm \
		php-mysql

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp

RUN	mkdir /run/php \
		&& mkdir -p /var/www/html \
		&& chown -R root:root /var/www/html

COPY	./tools/wp-auto.sh	/tmp/wp-auto.sh

RUN		chmod +x /tmp/wp-auto.sh

EXPOSE	9000

CMD		["sh", "-c", "/tmp/wp-auto.sh"]
