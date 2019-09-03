#!/usr/bin/env bash
set -xe

# Install PHP 7 and its modules
apt-get update -q
apt-get install -y \
   mysql-server

UPDATE mysql.user SET authentication_string = PASSWORD('isatis') WHERE User = 'root';
FLUSH PRIVILEGES;

CREATE DATABASE testdb;

INSERT INTO mysql.user (User,Host,authentication_string,ssl_cipher,x509_issuer,x509_subject)
VALUES('isatisuser','localhost',PASSWORD('isatispassword'),'','','');
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON testdb.* to isatisuser@localhost;
FLUSH PRIVILEGES;

sh /scripts/cleanup.sh
