# Inception

## Project Notes

### Docker Basic Commands for Testing Containers Individually

* Build image from Dockerfile: `docker build -f Dockerfile -t <name>:<tag> <path/to/Dockerfile/directory>`
* Get image ID: `docker images`
* Run in interactive mode: `docker run -it <image_id>`
* Show running container with port and container ID: `docker ps`
* Stop running container: `docker stop <container_id>`
* Show exited container: `docker ps -a`
* Remove exited container(s): `docker container prune`
* Execute a command inside a running container: `docker exec <container> <command>`
* Execute a command inside a running container in interactive mode: `docker exec -it <container_name> <command>`

### Dockerfile Basic Commands
* `FROM`: Downloads an image to use as the container's base. Here we are using Alpine:3.18.
* `RUN`: Runs the specified command during the building process. Useful for installing binaries for later use.
* `COPY`: Copy a file from host machine to the future docker container. Useful for loading custom configuration files.
* `ENTRYPOINT [ "command", "args"]`: The command to run at conainer startup.

### Docker-compose Debugging
* Remove service restart in `docker-compose.yml`
* `make up`
* Show container states: `docker-compose ps` (`cd` into `srcs` directory first)
* Show logs: `docker-compose logs` (add `--follow <container_name>` option to only see that container's logs)

### Useful Resources

Docker:

* [Docker Curriculum](https://docker-curriculum.com/)
* [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
* [How to Debug a Docker Compose Build](https://www.matthewsetter.com/basic-docker-compose-debugging/)

Alpine Linux:

* [Alpine Linux](https://www.alpinelinux.org/)

Nginx:

* [NGINX Configuration Beginner's Guide](https://nginx.org/en/docs/beginners_guide.html)
* [OpenSSL Man Page](https://www.openssl.org/docs/man1.0.2/man1/openssl-req.html)
* [Generate Self-Signed SSL Certificate with OpenSSL](https://stackoverflow.com/a/10176685)

MariaDB:

* [How do I find the MySQL my.cnf location](https://stackoverflow.com/a/2485758)
* [How to Install and Configure Mariadb](https://www.rootusers.com/how-to-install-and-configure-mariadb/)
* [Configuring MariaDB with Option Files](https://mariadb.com/kb/en/configuring-mariadb-with-option-files/)
* [MariaDB Server System Variables](https://mariadb.com/kb/en/server-system-variables/)
* [Configuring MariaDB for Remote Client Access](https://mariadb.com/kb/en/configuring-mariadb-for-remote-client-access/)
* [How to Allow Remote Access to MariaDB in Ubuntu Linux](https://geekrewind.com/allow-remote-access-to-mariadb-database-server-on-ubuntu-18-04/)

WordPress:

* [PHP](https://www.php.net/)
* [Installing WordPress with curl and WP-CLI](https://make.wordpress.org/cli/handbook/guides/installing/)
* [WP-CLI Commands](https://developer.wordpress.org/cli/commands/)
* [WP-CLI Overview](https://jparks.work/index.php?title=Wp-cli)
