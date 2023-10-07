# Inception

<p align="center">
  <img src="https://github.com/mcombeau/mcombeau/blob/main/42_badges/inceptione.png" alt="inception 42 project badge"/>
</p>

A 42 project aimed at learning Docker and Docker-compose. This project asks us to create a small network of 3 Docker containers, one containing Nginx, one containing Wordpress and the third containing MariaDB. All three must work together over the Docker network to display a local website.

## Status
Finished 06/10/2023. Grade: 100%

## Usage

Launching this project requires a bit of setup:

* Clone this repository and `cd` into it.
* In the `srcs` folder, there is an `ExampleEnvFile` that must be filled out and saved into `srcs/.env`
* The Makefile has a `login` variable that should be edited to reflect your 42 school login

Once these steps are complete, you can use `make` to build and launch the docker containers.

The website should be viewable at the adresses `https://localhost` or `http://login.42.fr` (replacing your login with the value in the Makefile variable).

## Project Notes

### Viewing Docker Images, Containers, Volumes and Networks

* Show Docker images: `docker images`
* Show Docker containers: `docker ps` (add `-a` option to view stopped/exited containers)
* Show Docker volumes: `docker volume ls` (`docker volume inspect <volume name>` to view more information about the volume)
* Show Docker networks: `docker network ls`

### Useful Commands for Debugging Docker Containers
* Show logs: `docker-compose logs` (add `--follow <container name>` option to only see that container's logs)
* Run a container in interactive mode: `docker run -it <image ID>`
* Execute a command inside a running container: `docker exec <container name> <command>`
* Execute a command inside a running container in interactive mode: `docker exec -it <container name> <command>`
* Execute an interactive shell inside a running container: `docker exec -it <container name> sh` (This shows that Docker containers are not secure, since we can easily get a shell as root)

### Dockerfile Basic Commands
* `FROM`: Downloads an image to use as the container's base. Here we are using Alpine:3.18.
* `RUN`: Runs the specified command during the building process. Useful for installing binaries for later use.
* `COPY`: Copy a file from host machine to the future docker container. Useful for loading custom configuration files.
* `EXPOSE`: Expose a port so that it is accessible from outside the Docker network.
* `ENTRYPOINT [ "command", "args"]`: The command to run at conainer startup.

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

---
Made by mcombeau: mcombeau@student.42.fr | LinkedIn: [mcombeau](https://www.linkedin.com/in/mia-combeau-86653420b/) | Website: [codequoi.com](https://www.codequoi.com)
