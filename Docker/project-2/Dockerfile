# Use the Node.js slim image as base
FROM node:slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application files from the host into the container at /app
COPY . /app

# Install dependencies defined in package.json using npm
RUN npm install

# Expose port 3000 to allow external access
EXPOSE 3000

# Command to start the Node.js application
CMD node index.js




# Commands used:
# - To build the Docker image: docker build -t hey-nodejs .
# - To run the Docker container: docker container run -d -p 3000:3000 hey-nodejs
