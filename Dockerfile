FROM circleci/php:5.6

RUN sudo apt-get update && sudo apt-get install -y \
  mysql-client \
  --no-install-recommends && sudo rm -r /var/lib/apt/lists/*
