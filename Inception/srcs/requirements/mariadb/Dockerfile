FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

COPY ./tools/dbscript.sh ./
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/lib/mysql/

EXPOSE 3306

RUN chmod +x ./dbscript.sh

ENTRYPOINT ["bash", "./dbscript.sh"]