#!/bin/bash
cd /var/www
php -d memory_limit=-1 /usr/local/bin/composer install
echo "alias drush='/wwwroot/vendor/drush/drush/drush'" >> /home/vagrant/.bashrc
echo "alias drupal='/wwwroot/vendor/drupal/console/bin/drupal'" >> /home/vagrant/.bashrc

