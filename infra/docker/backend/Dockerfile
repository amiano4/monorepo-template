FROM amiano4/php83

ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} app && useradd -u ${UID} -g ${GID} -m app
USER app

WORKDIR /var/www

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

COPY apps/backend ./

EXPOSE 9000

CMD ["php-fpm"]
