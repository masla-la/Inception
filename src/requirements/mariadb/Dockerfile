FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade -y && apt-get install -y \
            mariadb-server \
            mariadb-client

RUN     mkdir -p /var/run/mysqld \
            && chown -R mysql:mysql /var/run/mysqld

COPY    /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY    /tools/script.sh /tmp/configure.sh

RUN     chmod +x /tmp/configure.sh
RUN     chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

CMD     ["sh", "-c", "/tmp/configure.sh > /home/sql.sql && mysqld --init-file=/home/sql.sql"]
