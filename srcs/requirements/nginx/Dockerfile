FROM debian:buster

RUN apt-get update && apt-get -y install nginx openssl

RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=dev/CN=nbechon/emailAdress=nbechon@student.42.fr"\
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

COPY conf/nginx.conf /etc/nginx/sites-available/default
EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
