FROM 051910502774.dkr.ecr.ap-northeast-1.amazonaws.com/genken-prod-cms-base:latest

ARG BUILD_ENV=production

RUN if [ ${BUILD_ENV} != "prodution" ]; then apt-get update && apt-get install -y procps; fi
COPY docker-php-ext-* ./env/docker/php-fpm/docker-php-entrypoint /usr/local/bin/
ADD ./env/docker/php-fpm/docker.conf /usr/local/etc/php-fpm.d/docker.conf
ADD ./env/docker/php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
ADD ./env/docker/php-fpm/php.ini $PHP_INI_DIR/php.ini

ADD ./src /app

RUN chmod +x /usr/local/bin/docker-php-entrypoint && \
    chmod 777 -R storage && \
    chmod 777 -R bootstrap

RUN composer install
RUN if [ ${BUILD_ENV} = "production" ]; then composer install --no-dev; fi
#RUN php artisan config:clear && rm -rf .env

CMD ["php-fpm"]





