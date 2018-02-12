FROM circleci/php:5.6-cli-node-browsers

# Packages
RUN sudo apt-get update && sudo apt-get install -y \
  apt-transport-https \
  gnupg-curl \
  libmcrypt-dev \
  libxml2-dev \
  mysql-client \
  vim \
  wget \
  zlib1g-dev \
  --no-install-recommends && sudo rm -r /var/lib/apt/lists/* \
  && sudo docker-php-ext-install mcrypt soap zip \
  && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Composer
RUN  composer global require codacy/coverage "phpunit/phpcov:~2.0" "phpunit/phpunit:~4.8"

# NVM
RUN export NVM_DIR="$HOME/.nvm" \
  && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
  && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
  && nvm install 8.9.1
