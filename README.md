# postgres-repmgr-tutorial

Purpose of this repo is to investigate and gather snippets required to setup HA postgres cluster on a low abstracion level.

## Manual

### 1. Create publication user

```psql
postgres=# CREATE ROLE replicator REPLICATION LOGIN PASSWORD 'password';
CREATE ROLE

postgres=# CREATE DATABASE example;
CREATE DATABASE

postgres=# \c example;
psql (12.8 (Ubuntu 12.8-0ubuntu0.20.04.1), server 13.3 (Debian 13.3-1.pgdg100+1))
WARNING: psql major version 12, server major version 13.
         Some psql features might not work.
You are now connected to database "example" as user "postgres".
example=# CREATE TABLE accounts (
example(#  user_id serial PRIMARY KEY,
example(#  username VARCHAR ( 50 ) UNIQUE NOT NULL);
CREATE TABLE
example=# CREATE PUBLICATION bpub FOR TABLE accounts;
CREATE PUBLICATION
example=# GRANT ALL ON accounts TO replicator;
GRANT
```


subscripction on **postgres-01**
```psql
example01=# CREATE SUBSCRIPTION bsub CONNECTION 'dbname=example host=postgres-02 user=replicator password=password' PUBLICATION bpub;
NOTICE:  created replication slot "bsub" on publisher
CREATE SUBSCRIPTION
```

on **postgres-01**:



```zsh
apt-get update
apt -y install vim



```

docker-compose restart postgres-02


create publication

```psql

```

#TODO:
- purpose of `pg_hba.conf` and `postgresql.conf` files
- psql installation on localhost