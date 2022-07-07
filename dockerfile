FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install git -y
RUN apt-get install npm -y
RUN git clone https://github.com/darkomni5566/angular-starter-master.git
RUN cd angular-starter-master/
RUN npm install
RUN npm run build
RUN mv dist/ /var/www/html/
COPY 000-default.conf /etc/apache2/sites-available
COPY shell.sh /
CMD ["/usr/sbin/apache2ctl" "-DFOREGROUND"]
EXPOSE 80
