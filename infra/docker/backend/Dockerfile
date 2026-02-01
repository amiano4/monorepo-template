FROM amiano4/php84

WORKDIR /var/www/backend

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

COPY apps/backend ./

RUN mkdir -p storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

EXPOSE 9000

CMD ["php-fpm"]
