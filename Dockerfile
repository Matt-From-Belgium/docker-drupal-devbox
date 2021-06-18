FROM php:7.4-apache
WORKDIR /home/root
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get -y -qq install software-properties-common dialog apt-utils
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd\
    && docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN pecl install redis-5.1.1 \
    && pecl install xdebug-3.0.4 \
    && docker-php-ext-enable redis xdebug
RUN apt-get -y -qq install git default-mysql-client
RUN apt-get install zip unzip
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN export COMPOSER_MEMORY_LIMIT=-1
COPY ./drupal.sh /home/root
RUN rm -rf /var/www/html
RUN ln -s /var/www/web /var/www/html
WORKDIR /
EXPOSE 9003
EXPOSE 80
CMD ["apache2-foreground"]
