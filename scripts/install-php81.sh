#!/usr/bin/env bash
set -xe

# Add sury repository
echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list
echo "deb-src https://packages.sury.org/php/ stretch main" >> /etc/apt/sources.list.d/php.list
wget -O- "https://packages.sury.org/php/apt.gpg" | apt-key add -

# Install PHP 7 and its modules
apt-get update -q
apt-get install -y \
    php8.1-bcmath \
    php8.1-fpm \
    php8.1-bz2 \
    php8.1-curl \
    php8.1-gd \
    php8.1-intl \
    php8.1-imagick \
    php8.1-json \
    php8.1-mbstring \
    php8.1-mysql \
    php8.1-soap \
    php8.1-sqlite3 \
    php8.1-xdebug \
    php8.1-xml \
    php8.1-zip

rm /etc/apt/sources.list.d/php.list
sh /scripts/cleanup.sh
