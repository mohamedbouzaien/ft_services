#!/bin/sh
mv /usr/share/wordpress /var/www/
telegraf & php -S 0.0.0.0:5050 -t /var/www/wordpress/