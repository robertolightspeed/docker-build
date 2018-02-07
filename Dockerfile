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
  && sudo docker-php-ext-install mcrypt soap zip

# Composer
RUN  composer global require codacy/coverage phpunit/phpcov
