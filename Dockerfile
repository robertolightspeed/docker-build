FROM circleci/php:5.6

# Packages
RUN sudo apt-get update && sudo apt-get install -y \
  apt-transport-https \
  gnupg-curl \
  libmcrypt-dev \
  mysql-client \
  php5-cli \
  vim \
  wget \
  zlib1g-dev \
  --no-install-recommends && sudo rm -r /var/lib/apt/lists/* \
  && sudo docker-php-ext-install mcrypt zip \
  && sudo docker-php-ext-enable mcrypt zip

# Composer
ENV COMPOSER_VERSION 1.4.2
RUN curl -sS https://getcomposer.org/installer | sudo php -- --version="${COMPOSER_VERSION}" --install-dir="/usr/local/bin" --filename="composer"

# NVM
ENV NODE_VERSION 6.1.0
COPY nvm.sh /etc/profile.d/nvm.sh
RUN sudo git clone https://github.com/creationix/nvm.git /opt/nvm; \
  sudo mkdir -p /usr/local/node /usr/local/nvm && \
  sudo chmod 0777 -R /usr/local/nvm; sudo chmod 0777 -R /usr/local/node; \
  . /etc/profile.d/nvm.sh && \
  nvm install $NODE_VERSION && \
  nvm use $NODE_VERSION && \
  nvm alias default $NODE_VERSION && \
  nvm version

# YARN
ENV YARN_VERSION 0.21.3-1
COPY yarn.list /etc/apt/sources.list.d/yarn.list
RUN sudo apt-key adv --fetch-keys https://dl.yarnpkg.com/debian/pubkey.gpg && \
  sudo apt-get update && sudo apt-get install -y \
  yarn=$YARN_VERSION \
  --no-install-recommends && sudo rm -r /var/lib/apt/lists/*

ENV ENV="/etc/profile"
