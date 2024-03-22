FROM	debian:bullseye

RUN		apt-get update && apt-get upgrade && apt-get install -y \
			vsftpd


COPY    /tools/ftp_auto.sh /tmp/ftp_auto.sh
COPY	/conf/vsftpd.conf /tmp/vsftpd.conf
RUN		chmod -X /tmp/ftp_auto.sh	

CMD     ["sh", "/home/ftp_auto.sh"]
