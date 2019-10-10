FROM phusion/baseimage:latest

LABEL maintainer="Travis Jones <travisj@appsbytravis.com>"

RUN DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=C.UTF-8
ENV LC_CTYPE=UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

# Install "software-properties-common" (for the "add-apt-repository")
RUN apt-get update && apt-get install -y \
  software-properties-common

# Add the "PHP 7" ppa
RUN add-apt-repository -y \
  ppa:ondrej/php

# Install PHP-CLI 7, some PHP extentions and some useful Tools with APT
RUN apt-get update && apt-get install -y --force-yes \
  php-cli \
  php-common \
  php-curl \
  php-json \
  php-xml \
  php-mbstring \
  php-mcrypt \
  php-mysql \
  php-pgsql \
  php-sqlite3 \
  php-zip \
  php-memcached \
  php-gd \
  php-xdebug \
  php-dev \
  libcurl4-openssl-dev \
  libedit-dev \
  libssl-dev \
  libxml2-dev \
  xz-utils \
  sqlite3 \
  libsqlite3-dev \
  git \
  curl \
  vim \
  nano \
  unzip \
  zip

# Install nvm (Node Version Manager)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

# remove load xdebug extension
RUN sed -i 's/^/;/g' /etc/php/7.3/cli/conf.d/20-xdebug.ini

# Add bin folder of composer to PATH.
RUN echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc

# Install Composer
RUN curl -s http://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

# Load xdebug Zend extension with phpunit command
RUN echo "alias phpunit='php -dzend_extension=xdebug.so /var/www/vendor/bin/phpunit'" >> ~/.bashrc

ENV NVM_DIR=/root/.nvm

# Install stable node
RUN . ~/.nvm/nvm.sh && \
  nvm install stable && \
  nvm use stable && \
  nvm alias stable && \
  npm install -g gulp yarn

# Source the bash
RUN /bin/bash -c ". ~/.bashrc"

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www
