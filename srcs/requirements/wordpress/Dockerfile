FROM debian:buster

RUN apt-get update

RUN apt-get install

RUN apt-get -y install wget

RUN apt-get install -y php7.3
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN mv /var/www/wordpress/ /var/www/html

RUN mv /var/www/html/wordpress/* /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 /var/www/html

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools /var/www/

RUN mkdir -p /run/php

RUN chmod +x /var/www/wp-install.sh

CMD ["/usr/sbin/php-fpm7.3", "-F"]

