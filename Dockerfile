FROM debian
RUN apt update
RUN apt install apache2 -y
#RUN echo "$(whoami)" > /var/www/html/usuario1.html
#RUN useradd alumno
#USER alumno
#RUN echo "$(whoami)" > /tmp/usuario2.html
RUN apt install mongo -y
VOLUME /home/ehernandez/development/DOCKERFILE//mongodb/database:/data/db
#ENV autor Ernesto Hernandez

EXPOSE 27017
CMD apachectl -D FOREGROUND