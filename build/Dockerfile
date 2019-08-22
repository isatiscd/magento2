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

RUN /install-essentials.sh
RUN /install-python.sh
RUN /install-pip.sh
#RUN /scripts/install-aws-cli
RUN /install-node-tools.sh
RUN /install-php72.sh
RUN /install-composer.sh

# Show versions
RUN node --version && \
    npm --version && \
    yarn --version && \
    php --version && \
    composer --version && \
    php -m
