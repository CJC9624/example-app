#this file should run the docker app image
#this is the running of the alpine linux portion
FROM --platform=linux/x86-64 alpine:3.19.0
FROM php:8.2-fpm-alpine3.19.0
FROM php:8.2-cli

#this part should run the alpine portion
RUN apt-get update -y && apt-get install -y libmcrypt-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app

RUN composer install

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000

#example run and build commands:
#docker build -t example-app .
#docker run -it -p 8000:8000 example-app


#https://dockerize.io/guides/php-laravel-guide I used this to help me
