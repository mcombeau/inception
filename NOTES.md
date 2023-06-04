# Inception Notes

## Useful Links

* [Docker Curriculum](https://docker-curriculum.com/)
* [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
* [NGINX Configuration Beginner's Guide](https://nginx.org/en/docs/beginners_guide.html)
* [OpenSSL Man Page](https://www.openssl.org/docs/man1.0.2/man1/openssl-req.html)
* [Generate Self-Signed SSL Certificate with OpenSSL](https://stackoverflow.com/a/10176685)


## About Docker

### Images

Images are blueprints of the application, which form the basis of containters. 

* `docker pull <image>` gets an image
* `docker build -f Dockerfile path` builds an image according to a Dockerfile.
* `docker images` lists all images currently on the system.

### Containers

Created from Docker images, containers run the actual application. 
* `docker run <image-name-or-id>` creates and runs a container from an image. Exits container when done running.
* `docker run -it <image-name-or-id>` creates and runs a container from an image in interactive mode. Exits container when it gets `exit` as input.
* `docker ps` shows all currently running containers.
* `docker ps -a` shows all containers, even exited ones.

### Docker Daemon
Docker Daemon is the background service running on the host that manages building, running and distributing Docker containers. The daemon is the process that runs in the operating system which clients communicate with.

### Docker Client
Docker Client is the command line tool that allows the user to interact with the daemon.

### Docker Hub
Docker Hub is a registry of premade Docker images.

## Docker commands

Run a docker container from an image:
```
docker run <image>
```

Build a container from a Dockerfile:
``` 
docker build -f Dockerfile path
```

Run a command through an image (creates the container, runs the command and exits):
```
docker run <image_name_or_id> echo "Hello from container"
```

Run an image in an interactive container with a shell (creates the container, prompts for commands, executes until input is `exit`):
```
docker run -it <image> sh
```

Run and specify `hostPort:dockerPort` to map the host port to the docker port (important for NGINX):
```
docker run -p <hostPort>:<dockerPort> <image>
```

List currently running containers:
```
docker ps
```

List all containers (including exited ones):
```
docker ps -a
```

Stop a running docker container:
```
docker stop <container(s)>
```

Remove a container:
```
docker rm <container(s)>
```

Remove all exited containers:
``` 
docker container prune
```
Or,
```
docker rm $(docker ps -a -q -f status=exited)
```

View all images on the system:
```
docker images
```
 
View a container's ports:
```
docker ports <container>
```

