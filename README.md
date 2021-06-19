docker-php-devbox
This is the repo for the dockercontainer matthiasba/php-devbox on Dockerhub.

The image is based on the official PHP docker container but with some small changes to help PHP development

Some extensions come pre-installed: GD and XDebug
XDebug is automatically configured
php development standard ini is used for configuration
composer is installed without memory limit
How to use this container? The easiest way is to download the compiled image through docker hub:

make sure docker engine is installed
run the image using 'docker run matthiasba/docker-php-devbox'
You can log into command prompt by using docker exec -it <> /bin/bash
