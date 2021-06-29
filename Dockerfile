FROM ubuntu:18.04
LABEL Maintainer="Rykle Baron && Alex Vos"
LABEL Description="Example devcontainer" Vendor="Pruts" Version="0.2"
EXPOSE 8080/tcp
EXPOSE 22/tcp

# Base setup
RUN apt-get update && apt-get upgrade -y

# Locales setup
RUN apt-get install locales locales-all -y && locale-gen en_US.UTF-8
RUN apt-get install -y iputils-ping vim openssh-server
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get install -y  apache2 libapache2-mod-php 

### Add the website
RUN rm -rf /var/www/html/index.html
ADD --chown=www-data:www-data sources/html/index.php /var/www/html/index.php
ADD --chown=www-data:www-data sources/html/ping_get.php /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 774 /var/www/html/*

# Start ssh
CMD service ssh restart

# Add user test to system and copy ssh keys folder with correct permissions
ADD /sources/initscript.sh /tmp
RUN chmod 700 /tmp/initscript.sh 
RUN bash /tmp/initscript.sh
ADD sources/config /home/kaas/.ssh/config
ADD sources/oldPassFile /home/kaas/.oldPassFile
RUN chown -R kaas:kaas /home/kaas

WORKDIR /root
ADD --chown=root:root entrypoint.sh /opt/run/entrypoint.sh
RUN chmod 700 /opt/run/entrypoint.sh
ENTRYPOINT /opt/run/entrypoint.sh

# Clean up
RUN apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /tmp/*