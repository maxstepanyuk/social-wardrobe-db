# SocialWardrobe

Created by Maksym Stepaniuk ([maxstepanyuk](https://github.com/maxstepanyuk) on github). The original repository: [social-wardrobe-db](https://github.com/maxstepanyuk/social-wardrobe-db)

Before using this in your own works, please ask me first.

Contact me or see what I'm up to - [linktree](https://linktr.ee/purpexe)

# PostgreSQL in Docker

Docker:

```bash
# list
docker ps -a

# # run new
# sudo docker run --name postgresql -e POSTGRES_PASSWORD=postgres -d -p 5432:5432 postgres:latest
# # OR
# run new with volume, open port, detached from terminal, 
sudo docker volume create postgresql_data
sudo docker run --name postgresql -e POSTGRES_PASSWORD=postgres -v postgresql_data:/var/lib/postgresql/data -d -p 5432:5432  postgres:latest

# run stopped
sudo docker start container_name_or_id

# enter the container 
# sudo docker exec -it postgresql psql -U postgres
# or
sudo docker exec -it postgresql bash
psql -U postgres
```

## run commands in postgresql

**wardrobe** database for testing and the db demo for Uni

```bash
# create the database
create database wardrobe;

# connect / use this DB
\c wardrobe; 

# exit postgresql
\q

```


**wardrobe_fastapi** database for the backend api 

```bash
# create the database
create database wardrobe_fastapi;

# create user for access 
create user fastapi_user with encrypted password 'fastapi_user_password';

# and it the privileges
# grant all privileges on database wardrobe_fastapi to fastapi_user; # didnt work
# GRANT ALL ON TABLE public.items TO fastapi_user; #items table was used for testing
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO fastapi_user;

# connect / use this DB
\c wardrobe_fastapi; 

# # add access outside Docker ?? no need idk # TODO
# psql -h 127.0.0.1 -p 5432 postgres

# exit postgresql
\q

```

Docker:

```bash
# exit docker container
exit

###

# stop container
docker stop container_name_or_id
# remove container
docker rm container_name_or_id
```

connect client

- host: 127.0.0.1
- port: 5432
- user: postgres
- pass: postgres

for fastapi:

`SQLALCHEMY_DATABASE_URL = "postgresql://fastapi_user:fastapi_user_password@127.0.0.1/wardrobe_fastapi"`

template - `SQLALCHEMY_DATABASE_URL = "postgresql://username:password@localhost/dbname"`

- host: 127.0.0.1
- port: 5432
- user: fastapi_user
- pass: fastapi_user_password
- dbname: wardrobe_fastapi

- - -