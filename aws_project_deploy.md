# Deploying a Node.js Application on AWS EC2

## Initial Setup

### Clone the Project
git clone <URL>

### Initialise and Start the Project
cd <project-directory>
npm install
npm run start

## Set Up an AWS EC2 Instance

1. **Create an IAM User & Login to Your AWS Console**
   - **Access Type:** Password
   - **Permissions:** Admin

2. **Create an EC2 Instance**
   - **OS Image:** Ubuntu
   - **Instance Type:** t2.micro
   - Create a new key pair & download `.pem` file

3. **Connecting to the Instance Using SSH**
ssh -i instance.pem ubuntu@<IP_ADDRESS>

## Configuring Ubuntu on Remote VM

1. **Update Outdated Packages and Dependencies**
sudo apt update

2. **Install Git (Guide by DigitalOcean)**

3. **Configure Node.js and npm (Guide by DigitalOcean)**

## Deploying the Project on AWS

### Clone the Project in the Remote VM
git clone <URL>

### Set Up an Elastic IP Address for Your EC2 (This will be your DOMAIN)

### Initialise and Start the Project Again
cd <project-directory>
npm install
npm run start

**Note:** Edit the inbound rules in the security group of your EC2 to allow traffic from your specific port.

## Project is Deployed on AWS 🎉

Your project is now successfully deployed on AWS. Access it using the Elastic IP Address associated with your EC2 instance.
