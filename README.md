2024-03-03

- - -

ПІС 

ЛАБОРАТОРНЕ ЗАНЯТТЯ №3
Тема: Використання запитів

Завдання

1. + Заповнити даними створені у попередній роботі таблиці (близько 15 записів у кожній таблиці).
2. + Написати запити, до створеної бази даних, серед яких повинні бути присутні:
    1. простий запит на вибірку з однієї таблиці;
    2. простий запит на вибірку з декількох таблиць;
    3. запит з групуванням;
    4. запит з обчислювальним полем;
    5. запит з використанням агрегатних функцій;
    6. запит з сортуванням;
    7. запит з використанням умови;
    8. запит з використанням підзапитів.
3. + Створити 3 тригера (наприклад, для запису в журнал подій операцій з базою даних).
4. +* Продемонструвати вміння переносу даних в іншу систему керування базами даних (cтворити БД в СУБД, відмінній від тієї, що в попередній роботі, для прикладу, PostgreSQL).
- - -


# postgresql in Docker

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


# run commands in mysql

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