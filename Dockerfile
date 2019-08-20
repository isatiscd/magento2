FROM php:7.2-fpm


# Install dependencies
RUN apt-get update \
  && apt-get install -y \
    curl \
    git \
    libfreetype6-dev \ 
    libicu-dev \ 
    libjpeg62-turbo-dev \ 
    libmcrypt-dev \ 
    libpng-dev \ 
    libxslt1-dev \
    sendmail-bin \ 
    sendmail \
    ssh \
    sudo

# Configure the gd library
RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

# Install required PHP extensions
RUN docker-php-ext-install \
  dom \ 
  gd \ 
  intl \ 
  mbstring \ 
  pdo_mysql \ 
  xsl \ 
  zip \ 
  soap \ 
  bcmath

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update --preview
RUN command -v composer

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.4.7

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# install yarn global
RUN npm i yarn -g

# Install Xdebug (but don't enable)
#RUN pecl install -o -f xdebug

#ENV PHP_MEMORY_LIMIT 2G
ENV PHP_ENABLE_XDEBUG false
ENV MAGENTO_ROOT /usr/share/nginx/html

ENV DEBUG false
ENV UPDATE_UID_GID false

#ADD etc/php-xdebug.ini /usr/local/etc/php/conf.d/zz-xdebug-settings.ini
#ADD etc/mail.ini /usr/local/etc/php/conf.d/zz-mail.ini

#ADD docker-entrypoint.sh /docker-entrypoint.sh

#RUN ["chmod", "+x", "/docker-entrypoint.sh"]

#ENTRYPOINT ["/docker-entrypoint.sh"]

#ENV MAGENTO_RUN_MODE developer
ENV UPLOAD_MAX_FILESIZE 64M

#ADD etc/php-fpm.ini /usr/local/etc/php/conf.d/zz-magento.ini

#ADD etc/php-fpm.conf /usr/local/etc/

# Display versions installed
RUN php -v
RUN composer --version
RUN node -v
RUN npm -v

CMD ["php-fpm", "-F"]
