#!/usr/bin/env bash
set -xe

# Add sury repository
echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list
echo "deb-src https://packages.sury.org/php/ buster main" >> /etc/apt/sources.list.d/php.list
wget -O- "https://packages.sury.org/php/apt.gpg" | apt-key add -

# Install PHP 7 and its modules
apt-get update -q
apt-get install -y \
    php7.4-bcmath \
    php7.4-fpm \
    php7.4-bz2 \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-imagick \
    php7.4-json \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-soap \
    php7.4-sqlite3 \
    php7.4-xdebug \
    php7.4-xml \
    php7.4-zip

rm /etc/apt/sources.list.d/php.list
sh /scripts/cleanup.sh
