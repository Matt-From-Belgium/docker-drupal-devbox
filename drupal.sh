#!/bin/bash
cd /var/www
php -d memory_limit=-1 /usr/local/bin/composer install


