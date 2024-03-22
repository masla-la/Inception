if [ ! -f "etc/vsftpd_on" ]; then

	#mv /tmp/vsftpd.conf etc/vsftpd.conf
	cp etc/vsftpd.conf etc/vsftpd_on

	service vsftpd start

	adduser $FTP_USER --disabled-password

	echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd

	chown -R $FTP_USER:$FTP_USER /var/www/html

	echo $FTP_USER >> /etc/vsftpd.userlist

	echo "
		pasv_enable=YES
		pasv_min_port=21100
		pasv_max_port=21110
		local_root=/var/www/html
		local_enable=YES
		allow_writeable_chroot=YES" >> /etc/vsftpd.conf

	service vsftpd stop

fi

/usr/sbin/vsftpd


#service vsftpd start
