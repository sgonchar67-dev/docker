FROM php:8.1-fpm

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN apt-get update \
  && apt-get install -y \
             apt-utils \
             man \
             curl \
             git \
             bash \
             vim \
             zip unzip \
             acl \
             iproute2 \
             dnsutils \
             fonts-freefont-ttf \
             fontconfig \
             dbus \
             openssh-client \
             sendmail \
             libfreetype6-dev \
             libjpeg62-turbo-dev \
             icu-devtools \
             libicu-dev \
             libmcrypt4 \
             libmcrypt-dev \
             libpng-dev \
             zlib1g-dev \
             libxml2-dev \
             libzip-dev \
             libonig-dev \
             graphviz \
             libcurl4-openssl-dev \
             pkg-config \
             libldap2-dev \
             libpq-dev \
  && pecl install mongodb \
  && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/mongodb-ext.ini

RUN docker-php-ext-configure intl --enable-intl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install pdo \
        pgsql pdo_pgsql \
        mysqli pdo_mysql \
        intl iconv mbstring \
        zip pcntl \
        exif opcache \
    && docker-php-source delete

RUN apt-get update

RUN apt-get install -y libmagickwand-dev
RUN apt-get install -y imagemagick

RUN pecl install imagick
RUN docker-php-ext-enable imagick

RUN pecl install redis
RUN docker-php-ext-enable redis

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ADD ./php.ini /usr/local/etc/php/php.ini
ADD ./conf.d/ /usr/local/etc/php/conf.d/

WORKDIR /var/www

CMD ["php-fpm"]
