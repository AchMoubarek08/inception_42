FROM debian:buster

RUN apt update && apt upgrade && apt install nginx -y

RUN apt install vim -y && apt install curl -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf


COPY tools/index.html /var/www/html/

#CMD ["mv", "/var/www/index.html" , "/var/www/html/"]

CMD [ "nginx", "-g", "daemon off;" ]
