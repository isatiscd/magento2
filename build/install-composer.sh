#!/usr/bin/env bash
set -xe

# Install composer
curl -sS "https://getcomposer.org/installer" | php -- --install-dir=/usr/local/bin --filename=composer
chmod a+x /usr/local/bin/composer
composer selfupdate
