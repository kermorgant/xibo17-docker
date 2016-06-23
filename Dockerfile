FROM php:5-fpm
MAINTAINER Mikael Kermorgant <mikael.kermorgant@gmail.com>
ENV REFRESHED_AT 2016-06-28

RUN apt-get update && apt-get install -y \
	ssmtp \
	wget \
	anacron \
        mysql-client \
        libpng-dev \
        libcurl4-gnutls-dev \
        libmcrypt-dev \
        libicu-dev \
        libxml2-dev  \
    && docker-php-ext-install gd curl \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install mysql soap gettext calendar zip 
    && docker-php-ext-install intl
#    && docker-php-ext-install zmq

ENV XIBO_VERSION=1.7.7

ADD php.ini /usr/local/etc/php/php.ini
ADD https://github.com/xibosignage/xibo-cms/archive/${XIBO_VERSION}.tar.gz /var/www/xibo-cms.tar.gz
ADD wait-for-it.sh  /usr/local/bin/wait-for-it.sh
ADD settings.php-template /tmp/settings.php-template
ADD ssmtp.conf /etc/ssmtp/ssmtp.conf

RUN mkdir -p /var/www/xibo
RUN mkdir -p /var/www/backup

VOLUME /var/www/xibo
WORKDIR /var/www/xibo

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh /usr/local/bin/wait-for-it.sh

# Create a flag file which the bootstrapping process will delete
# This tells us if we're doing a new install/upgrade on run
RUN touch /CMS-FLAG

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm"]
