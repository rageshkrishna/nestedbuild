FROM ubuntu:12.04
RUN apt-get update && apt-get install -y wget && wget --no-check-certificate https://phar.phpunit.de/phpunit.phar && chmod +x phpunit.phar && mv phpunit.phar /usr/local/bin/phpunit
FROM ubuntu:12.04
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
EXPOSE 80
CMD /usr/sbin/apache2 -D FOREGROUND
FROM kstaken/apache2
RUN apt-get update && apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-cli && apt-get clean && rm -rf /var/lib/apt/lists/*
CMD /usr/sbin/apache2 -D FOREGROUND
