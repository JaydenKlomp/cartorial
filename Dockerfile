FROM php:8.3-fpm-bullseye
# Arguments defined in docker-compose.yml
ARG user
ARG uid
# Install system dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    git \
    gnupg \
    libasound2 \
    libfontconfig1 \
    libfreetype6-dev \
    libgbm-dev \
    libjpeg62 \
    libjpeg62-turbo-dev \
    libnss3 \
    libonig-dev \
    libpng-dev \
    libssl-dev \
    libxml2-dev \
    libxrender1 \
    libzip-dev \
    net-tools \
    openssl \
    python3 \
    software-properties-common \
    supervisor \
    unzip \
    zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Install PHP extensions
RUN CFLAGS="$CFLAGS -D_GNU_SOURCE" docker-php-ext-install opcache pdo_mysql mbstring exif pcntl bcmath zip -j$(nproc) gd sockets
# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Get NodeJS
COPY --from=node:18-slim /usr/local/bin /usr/local/bin
# Get NPM
COPY --from=node:18-slim /usr/local/lib/node_modules /usr/local/lib/node_modules
# SOKETI(Websockets)
RUN npm install -g @soketi/soketi 
# Set working directory
WORKDIR /var/www
USER root
