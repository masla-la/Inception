FROM   debian:bullseye

RUN    apt-get update && apt-get upgrade && apt-get install -y \
            nginx \
            openssl

RUN    mkdir /etc/nginx/ssl

RUN    openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
            -out /etc/nginx/ssl/inception.crt \
            -keyout /etc/nginx/ssl/inception.key \
            -subj "/C=FR/ST=Paris/O=42/CN=masla-la.42.fr"

RUN     mkdir -p /var/run/nginx/

COPY    /conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE  443

CMD     ["nginx", "-g", "daemon off;"]
