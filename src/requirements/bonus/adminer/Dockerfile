FROM    debian:bullseye

RUN		apt-get update && apt-get -y install \
		curl \
		php7.4 \
		php-fpm \
		php-mysql

RUN		mkdir /run/php

RUN		curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

COPY	./tools/adminer_auto.sh /tmp/adminer_auto.sh

RUN		chmod +X /tmp/adminer_auto.sh

EXPOSE	9000

CMD		["sh", "/tmp/adminer_auto.sh"]
