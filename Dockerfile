FROM hhvm/hhvm:4.168-latest

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
RUN sed -i '/dl.hhvm.com/d' /etc/apt/sources.list && apt-get update && apt-get install -y watchman && rm -rf /var/lib/apt/lists/*
ENV COMPOSER=composer.dev.json

WORKDIR /mnt/project

COPY . .
COPY .hhconfig /etc/hh.conf
CMD composer update && \
    vendor/bin/pha-linters-server.sh -s -g -b ./vendor/hershel-theodore-layton/portable-hack-ast-linters-server/bin/portable-hack-ast-linters-server-bundled.resource
