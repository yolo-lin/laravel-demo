FROM 983401567698.dkr.ecr.ap-northeast-1.amazonaws.com/laravel-demo/base-nginx:45c6f58f810a92685f3e3b22fb10be7e4cfb745a
COPY --chown=www-data:www-data ./demo /var/www/
COPY ./demo/docker/nginx/default.conf /etc/nginx/sites-available/
RUN chown -R www-data:www-data /var/www/
