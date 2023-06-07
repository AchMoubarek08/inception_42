FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get -y install wget \
    && apt-get install -y php7.3 &&\
    apt-get install -y php-fpm &&\
    apt-get install -y php-mysql &&\
    apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN mv /var/www/html/wordpress/* /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 /var/www/html

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools /var/www/

RUN mkdir -p /run/php

RUN chmod +x /var/www/wp-install.sh

CMD ["/var/www/wp-install.sh" ,"/usr/sbin/php-fpm7.3", "-F"]

