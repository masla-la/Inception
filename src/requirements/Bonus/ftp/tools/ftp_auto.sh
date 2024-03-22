if [! -f "etc/vsftpd_on"];
then

	mv /tmp/vsftpd.conf etc/vsftpd.conf
	cp etc/vsftpd.conf etc/vsftpd_on

	adduser $FTP_USER --disable-password

	echo $FTP_PASSWORD $FTP_PASSWORD | passwd --stdin $FTP_USER

	chown -R $FTP_USER:$FTP_USER /var/www/html

	echo $FTP_USER >> /etc/vsftpd.userlist

fi

/usr/sbin/vsftpd etc/vsftpd.conf