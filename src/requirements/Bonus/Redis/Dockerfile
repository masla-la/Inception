FROM	debian:bullseye

RUN		apt-get update && apt-get upgrade && apt-get install -y \
			redis


COPY    /tools/redis_auto.sh /tmp/redis_auto.sh

EXPOSE	6379

CMD     ["sh", "/home/redis_auto.sh"]
