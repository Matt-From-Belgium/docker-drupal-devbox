#!/bin/bash
cd /var/www
php -d memory_limit=-1 /usr/local/bin/composer install
echo "alias drush='/wwwroot/vendor/drush/drush/drush'" >> /home/root/.bashrc
echo "alias drupal='/wwwroot/vendor/drupal/console/bin/drupal'" >> /home/root/.bashrc
./vendor/drush/drush/drush -y si minimal --db-url=mysql://root:secret@mysq-server/drupal --config-dir=/var/www/config --account-pass=admin
./vendor/drush/drush/drush -y cr
apache2-foreground
