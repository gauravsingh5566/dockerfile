FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install git -y
RUN apt-get install npm -y
COPY 000-default.conf /etc/apache2/sites-available
COPY shell.sh /
COPY pullif.sh /
RUN sh shell.sh

CMD ["/usr/sbin/apache2ctl" "-DFOREGROUND"]
EXPOSE 80


