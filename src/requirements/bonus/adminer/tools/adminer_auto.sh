adduser www-data www-data

chown -R www-data:www-data /var/www/html

mv adminer-4.8.1.php /var/www/html/adminer.php

/usr/sbin/php-fpm7.4 --nodaemonize
