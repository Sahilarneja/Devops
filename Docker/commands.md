# Docker Cheat Sheet

## Checking Docker Version (`docker --version`)

- This command displays the currently installed version of Docker on your system.

## Listing Docker Images (`docker images`)

- This command lists all the Docker images that are currently available on your system. Images are the templates used to create Docker containers.

## Running Hello World Container (`docker run hello-world`)

- This command runs a simple Docker container called "hello-world". It's commonly used as a test to ensure that Docker is installed and running correctly.

## Pulling Docker Images (`docker pull [imageName]`)

- This command pulls a Docker image from a registry (e.g., Docker Hub) to your local system. You specify the name of the image you want to pull.

## Pulling Docker Images with a Specific Version (`docker pull openjdk:18`)

- This command pulls a specific version of a Docker image. In this example, it pulls the "openjdk" image with version 18.

## Searching for Docker Images (`docker search [imageName]`)

- This command searches for Docker images available on Docker Hub or other registries based on the specified image name.

## Listing Docker Containers (`docker ps` / `docker ps -a`)

- `docker ps`: Lists all running Docker containers.
- `docker ps -a`: Lists all Docker containers, including stopped ones.

## Running Docker Containers

- `docker run -e`: Used to set environment variables for the container.
- `docker run -d`: Used to run a container in detached mode (background).
- `docker run --name`: Assigns a name to the container.
- `docker run -it -d`: Runs a container interactively in detached mode.

## Stopping Docker Containers (`docker stop [containerName / containerId]`)

- This command stops a running Docker container. You can specify either the container name or ID.

## Executing Commands Inside Containers (`docker exec -it [containerId] [command]`)

- This command allows you to enter a running Docker container and execute commands inside it. You specify the container ID and the command to execute.

## Inspecting Docker Containers (`docker inspect [containerId]`)

- This command provides detailed information about a Docker container, including its configuration, network settings, and more.

## Removing Docker Containers and Images

- `docker rm [containerId]`: Removes a Docker container. You specify the container ID.
- `docker rmi [imageName]`: Removes a Docker image. You specify the image name.

## Restarting Docker Containers (`docker restart [containerName]`)

- This command restarts a stopped Docker container. You specify the container name.

## Other Docker Commands

- `docker login`: Logs in to a Docker registry.
- `docker commit`: Creates a new image based on changes made to a container.
- `docker push`: Pushes a Docker image to a registry.
- `docker copy`: Copies files or directories between a container and the local filesystem.
- `docker logs`: Retrieves the logs of a Docker container.
- `docker volume`: Manages Docker volumes for persistent data storage.
- `docker logout`: Logs out from a Docker registry.

