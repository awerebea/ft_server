# ft_server
21-School (Ecole42) 'ft_server' project. Score 100/100

This is a System Administration project. The web server installed using "docker" technology, that runs Wordpress, phpMyAdmin, and a SQL database.

# Usage

```shell
# build image:
docker build -t ft_server:final .

# launch container:
docker run --name ft_server -p 80:80 -p 443:443 -it -d ft_server:final

# run a command in running container (eg. to go "in" launched contaner):
docker exec -it ft_server bash

# stop container:
docker stop ft_server

# start previously stopped container:
docker start ft_server

# remove container:
docker rm ft_server

# remove image
docker rmi ft_server:final

# stop all containers
docker stop $(docker ps -qa)

# remove all containers
docker rm $(docker container ls -qa)

# remove all images
docker rmi $(docker image ls -qa)
```
