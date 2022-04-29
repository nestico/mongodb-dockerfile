

FROM debian
RUN apt-get update
RUN apt-get install wget gnupg2 -y
RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc |  apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" |  tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update
RUN apt-get install -y mongodb-org
VOLUME /home/ehernandez/development/DOCKERFILE//mongodb/database:/data/db
EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod"]

# FROM fedora
# #COMMENT { "description": "mongodb service container",
# # "usage": "docker run -d -p 27017:27017 --name mongodb mlamouri/mongodb --volume=/mydbdatadir:/var/lib/mongodb" }
# RUN  yum install -y mongodb-server && yum clean all
# RUN  mkdir -p /var/lib/mongodb &&
# RUN    touch /var/lib/mongodb/.keep &&
#   RUN  chown -R mongodb:mongodb /var/lib/mongodb
# ADD mongodb.conf /etc/mongodb.conf
# VOLUME [ "/var/lib/mongodb" ]
# EXPOSE 27017
# USER mongodb
# WORKDIR /var/lib/mongodb
# ENTRYPOINT ["/usr/bin/mongod", "--config", "/etc/mongodb.conf"]
# CMD ["--quiet"]
#============================================
# Set the base image to Ubuntu
# FROM ubuntu

# # Update the repository sources list and install gnupg2
# RUN apt-get update && apt-get install -y gnupg2

# # Add the package verification key
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# # Add MongoDB to the repository sources list
# RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > tee /etc/apt/sources.list.d/mongodb.list

# # Update the repository sources list
# RUN apt-get update

# # Install MongoDB package (.deb)
# RUN apt-get install -y mongodb

# # Create the default data directory
# RUN mkdir -p /data/db

# # Expose the default port
# EXPOSE 27017

# # Default port to execute the entrypoint (MongoDB)
# CMD ["--port 27017"]

# # Set default container command
# ENTRYPOINT usr/bin/mongodb




#FROM debian
# RUN apt update
# #RUN apt install apache2 -y
# RUN apt-get install -y gnupg2
# #RUN apt-get install -y yum
# RUN apt-get install aptitude
# RUN aptitude install fuse
# RUN yum install -y wget
# RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

# RUN apt-get install -y mongodb-org
# VOLUME /home/ehernandez/development/DOCKERFILE//mongodb/database:/data/db
# EXPOSE 27017
# # Set /usr/bin/mongod as the dockerized entry-point application
# ENTRYPOINT ["/usr/bin/mongod"]
# CMD ["--port 27017"]