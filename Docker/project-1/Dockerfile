# Use the official Python 3 Alpine image as base
FROM python:3-alpine3.15

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Python dependencies defined in requirements.txt
RUN pip install -r requirements.txt

# Expose port 3000 to allow external access
EXPOSE 3000

# Command to run the Python application
CMD python ./index.py

# Commands used:
# - To build the Docker image: docker build -t hey-python-flask:0.0.1.RELEASE .
# - To run the Docker container: docker run -d -p 3000:3000 hey-python-flask:0.0.1.RELEASE
# - To push the Docker image to a registry: docker push hey-python-flask:0.0.1.RELEASE
