#!/bin/sh

mysql -uroot < ejabberd.sql

mysql -uroot < updatemysql.sql

