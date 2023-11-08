FROM php:8.0-apache

# Install additional PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copie des fichiers de l'application
COPY . /var/www/html

# Installation des dépendances avec Composer
RUN composer install --no-interaction --no-dev --optimize-autoloader

#########################################################

FROM mysql:latest

# Copie du fichier SQL dans l'image
COPY db.sql /docker-entrypoint-initdb.d/