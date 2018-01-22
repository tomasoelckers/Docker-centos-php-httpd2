FROM centos:centos7

MAINTAINER toelckers <tomasoel@gmail.com>

# -----------------------------------------------------------------------------
# Apache + PHP
# -----------------------------------------------------------------------------
RUN	yum -y update \
	&& yum --setopt=tsflags=nodocs -y install \
	gcc \
	gcc-c++ \
	httpd \
	mod_ssl \
	php56w \
	php56w-cli \
	php56w-devel \
	php56w-mysql \
	php56w-pdo \
	php56w-mbstring \
	php56w-soap \
	php56w-gd \
	php56w-xml \
	php56w-pecl-apcu \
	unzip \

# -----------------------------------------------------------------------------
# Copy Application Files
# -----------------------------------------------------------------------------
RUN rm -rf /var/www/html/*
ADD dockerize-php-example /var/www/html

# -----------------------------------------------------------------------------
# Virtual hosts configuration
# -----------------------------------------------------------------------------
ADD dockerize-php-example/httpd.conf /etc/httpd/conf/httpd.conf

# -----------------------------------------------------------------------------
# Set permissions
# -----------------------------------------------------------------------------
RUN chown -R apache:apache /var/www/app
ENV APACHE_RUN_USER apache
ENV APACHE_RUN_GROUP apache
ENV APACHE_LOG_DIR /var/log/httpd

#Open port 80
EXPOSE 80

#Start Apache Service

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
