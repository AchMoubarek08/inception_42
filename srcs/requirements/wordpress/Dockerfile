FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get -y install wget \
    && apt-get install -y php7.3 &&\
    apt-get install -y php-fpm &&\
    apt-get install -y php-mysql &&\
    apt-get install -y mariadb-client


COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools /var/www/

RUN chmod +x /var/www/wp-install.sh

CMD ["/var/www/wp-install.sh" ,"/usr/sbin/php-fpm7.3", "-F"]

