#!/bin/bash

# Cache
php artisan route:cache --quiet
php artisan config:cache --quiet

# migrate lunch
php artisan cache:clear
php artisan migrate:refresh --seed
php artisan passport:install

# php-fpm sever lunch
php-fpm
