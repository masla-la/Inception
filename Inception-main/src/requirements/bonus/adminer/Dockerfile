FROM    debian:bullseye

RUN		apt-get update && apt-get -y install \
		curl \
		php7.4 \
		php-fpm \
		php-mysql

RUN		mkdir /run/php

RUN		curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

#RUN		mv ./adminer-4.8.1.php /var/www/html/adminer.php
			#&& adduser www-data www-data


COPY	./tools/adminer_auto.sh /tmp/adminer_auto.sh
#COPY	./conf/www.conf	/etc/php7.4/php-fpm.d/www.conf

RUN	chmod +X /tmp/adminer_auto.sh

EXPOSE	9000

CMD		["sh", "/tmp/adminer_auto.sh"]
