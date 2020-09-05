FROM 983401567698.dkr.ecr.ap-northeast-1.amazonaws.com/laravel-demo/base-phpfpm:45c6f58f810a92685f3e3b22fb10be7e4cfb745a as base

FROM base as build-stage

ARG PRODUCTION=true

USER root

COPY --chown=www-data:www-data ./demo /var/www/

RUN set -exu; \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer; \
    mkdir -p /var/www/.composer; \
    mkdir -p /var/www/vendor; \
    chown -R www-data:www-data /var/www/

USER www-data

RUN set -eux; \
if [ ${PRODUCTION} = true ]; then \
    composer install --no-dev --no-interaction --optimize-autoloader --classmap-authoritative; \
else \
    composer install --no-interaction --optimize-autoloader --classmap-authoritative; \
fi; \
rm -rf ./.composer

USER root

FROM base
COPY --from=build-stage /var/www/ /var/www/
COPY ./demo/docker/phpfpm/php7.4.ini /usr/local/etc/php/php.ini
COPY ./demo/docker/phpfpm/run.sh /tmp
ENTRYPOINT ["/tmp/run.sh"]
