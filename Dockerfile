FROM php:7.1-apache
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get -y -qq install software-properties-common dialog apt-utils

CMD /bin/bash
