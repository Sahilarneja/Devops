# to create a volume
docker volume create test

# docker volume check
docker volume ls

# to get details of specific volume
docker volume inspect test

#to remove specific volume
docker volume rm test

# Docker container in detached mode, mounting a volume named "test" to the "/app" directory within the container.
docker run -d --mount source=test,target=/app my-image:latest

