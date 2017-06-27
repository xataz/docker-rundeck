# Rundeck

> This image is build on my own server and push directly.
> If you don't trust, you can build yourself.


## Features
* Based on alpine
* No **ROOT** process.
* Latest rundeck version
* Persist data


## Tag available
* latest, 2.8.2 [(rundeck/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/rundeck/Dockerfile)


## Description
What is [Rundeck](http://rundeck.org/) ?
Rundeck is an open source automation service with a web console, command line tools and a WebAPI. It lets you easily run automation tasks across a set of nodes.


## BUILD IMAGE
### Build arguments
* RUNDECK_VER : Rundeck version

### simple build
```shell
docker build -t xataz/rundeck github.com/xataz/dockerfiles.git#master:rundeck
```

### Build with arguments
```shell
docker build -t xataz/rundeck:2.7.1 --build-arg RUNDECK_VER=2.7.1 github.com/xataz/dockerfiles.git#master:rundeck
```

## Configuration
### Environments
* URI_ACCESS : External URI access "http://localhost:4440"
* ADMIN_PASSWORD="4dM!n"
* USER_NAME="user"
* USER_PASSWORD="U53r"
* UID=991
* GID=991

### Volumes
* /rundeck/projects
* /rundeck/config
* /rundeck/conf
* /home/rundeck

### Ports
* 4440




