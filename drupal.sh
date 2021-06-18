#!/bin/bash
cd /var/www
ln -s /var/www/web /var/www/html
php -d memory_limit=-1 /usr/local/bin/composer install
cp /var/www/web/sites/default.settings.php /var/www/web/sites/settings.php
chown -R root:www-data /var/www/web/sites
chmod -R 775 /var/www/web/sites
echo "alias drush='/var/www/vendor/drush/drush/drush'" >> /home/root/.bashrc
echo "alias drupal='/var/www/vendor/drupal/console/bin/drupal'" >> /home/root/.bashrc
./vendor/drush/drush/drush -y si minimal --root=/var/www/web --db-url=mysql://root:secret@mysql-server/drupal --config-dir=/var/www/config --account-pass=admin
./vendor/drush/drush/drush -y cr
a2en rewrite
apache2-foreground
