# SocialWardrobe

Created by Maksym Stepaniuk ([maxstepanyuk](https://github.com/maxstepanyuk) on github). The original repository: [social-wardrobe-db](https://github.com/maxstepanyuk/social-wardrobe-db)

Before using this in your own works, please ask me first.

Contact me or see what I'm up to - [linktree](https://linktr.ee/purpexe)

# PostgreSQL in Docker

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


# run commands in postgresql

# exit postgresql
\q

# exit docker container
exit

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

- - -