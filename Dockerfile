FROM circleci/php:5.6

# MySQL client
RUN sudo apt-get update && sudo apt-get install -y \
  libmcrypt-dev \
  mysql-client \
  php5-cli \
  vim \
  zlib1g-dev \
  --no-install-recommends && sudo rm -r /var/lib/apt/lists/* \
  && sudo docker-php-ext-install mcrypt zip \
  && sudo docker-php-ext-enable mcrypt zip

# Composer
ENV COMPOSER_VERSION 1.4.2
RUN curl -sS https://getcomposer.org/installer | sudo php -- --version="${COMPOSER_VERSION}" --install-dir="/usr/local/bin" --filename="composer"
