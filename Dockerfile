FROM node:8-stretch

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Tell npm to display only warnings and errors
ENV NPM_CONFIG_LOGLEVEL warn

# Disable composer interaction, and root user and xdebug warnings
ENV COMPOSER_NO_INTERACTION 1
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_DISABLE_XDEBUG_WARN 1

ADD / /
ENTRYPOINT ["sh", "/scripts/install-essentials.sh"]
ENTRYPOINT ["sh", "/scripts/install-python.sh"]
ENTRYPOINT ["sh", "/scripts/install-pip.sh"]
ENTRYPOINT ["sh", "/scripts/install-node-tools.sh"]
ENTRYPOINT ["sh", "/scripts/install-php72.sh"]
ENTRYPOINT ["sh", "/scripts/install-composer.sh"]

# Show versions
RUN node --version && \
    npm --version && \
    yarn --version && \
    php --version && \
    composer --version && \
    php -m
