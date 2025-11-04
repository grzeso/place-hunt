# Wybieramy oficjalny obraz PHP z Apache
FROM php:8.2-apache

# Instalacja rozszerzeń potrzebnych do Symfony i MySQL
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install intl pdo pdo_mysql mbstring xml

# Włącz moduł mod_rewrite dla Apache
RUN a2enmod rewrite

# Ustawienie katalogu roboczego
WORKDIR /var/www/html

# Kopiujemy pliki projektu
COPY . /var/www/html

# Instalacja Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Expose port 8080, żeby nie kolidował z XAMPP (Apache na 80)
EXPOSE 8080
