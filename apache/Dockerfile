FROM httpd:2.4.39

LABEL maintainer="Travis Jones <travisj@appsbytravis.com>"

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /usr/local/apache2
ENV APACHE_PID_FILE /usr/local/apache2/apache2.pid
ENV APACHE_ULIMIT_MAX_FILES 'ulimit -n 65536'

RUN mkdir /var/log/apache2
RUN mkdir /usr/local/apache2/conf/sites
RUN mkdir /usr/local/apache2/conf/mods
RUN mkdir /usr/local/apache2/conf/ssl

ADD default-site.conf /usr/local/apache2/conf/sites/default-site.conf
ADD php7.3.conf /usr/local/apache2/conf/mods/php7.3.conf
ADD ssl.conf /usr/local/apache2/conf/mods/ssl.conf
ADD httpd.conf /usr/local/apache2/conf/httpd.conf
ADD ./ssl /usr/local/apache2/conf/ssl

RUN usermod -u 1000 www-data

EXPOSE 80 443
