#!/usr/bin/env bash
set -xe

# Add sury repository
echo "deb https://packages.sury.org/php/ bust main" > /etc/apt/sources.list.d/php.list
echo "deb-src https://packages.sury.org/php/ bust main" >> /etc/apt/sources.list.d/php.list
wget -O- "https://packages.sury.org/php/apt.gpg" | apt-key add -

# Install PHP 7 and its modules
apt-get update -q
apt-get install -y \
    php7.3-bcmath \
    php7.3-fpm \
    php7.3-bz2 \
    php7.3-curl \
    php7.3-gd \
    php7.3-intl \
    php7.3-imagick \
    php7.3-json \
    php7.3-mbstring \
    php7.3-mysql \
    php7.3-soap \
    php7.3-sqlite3 \
    php7.3-xdebug \
    php7.3-xml \
    php7.3-zip

rm /etc/apt/sources.list.d/php.list
sh /scripts/cleanup.sh
