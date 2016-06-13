FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y mysql-server-5.6
COPY ejabberd.sql /ejabberd.sql
COPY updatemysql.sh /updatemysql.sh
COPY my.cnf /etc/mysql/
COPY updatemysql.sql /updatemysql.sql
RUN chmod 755 /etc/mysql/my.cnf
RUN chmod 755 /updatemysql.sh
EXPOSE 3306
RUN service mysql start && /updatemysql.sh && service mysql stop
#ENTRYPOINT service mysql start && tail -f /dev/null
COPY run.sh /run.sh
RUN chmod 755 /run.sh
ENTRYPOINT ["/run.sh"]

