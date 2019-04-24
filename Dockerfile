FROM owncloud/ubuntu:16.04

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>" \
  org.label-schema.name="ownCloud CI NodeJS" \
  org.label-schema.vendor="ownCloud GmbH" \
  org.label-schema.schema-version="1.0"

VOLUME ["/var/www/owncloud"]

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://deb.nodesource.com/node_8.x xenial main" | tee /etc/apt/sources.list.d/node.list

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y nodejs git-core chromium-browser && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g yarn npx

ENV CHROME_BIN=/usr/bin/chromium-browser \
  CHROME_PATH=/usr/lib/chromium/

COPY rootfs /
WORKDIR /var/www/owncloud
