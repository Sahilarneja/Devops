# AWS Infrastructure Provisioning with Terraform

This project involves using Terraform to provision an AWS infrastructure consisting of several resources to host a basic web server application. Here's a brief explanation of each component:

## Provider Block
- Specifies the AWS credentials and region for Terraform to use.

## VPC (Virtual Private Cloud)
- Creates a VPC with a specified CIDR block and tags it as "production".

## Internet Gateway
- Creates an internet gateway and attaches it to the VPC to allow internet access.

## Route Table
- Creates a custom route table for the VPC.
- Configures the route table to route all traffic through the internet gateway.

## Subnet
- Creates a subnet within the VPC with a specified CIDR block and availability zone.
- Tags the subnet as "prod-subnet".

## Route Table Association
- Associates the subnet with the custom route table to control the routing within the VPC.

## Security Group
- Creates a security group named "allow_web_traffic" to control inbound and outbound traffic.
- Allows inbound traffic on ports 22 (SSH), 80 (HTTP), and 443 (HTTPS) from any source.
- Allows all outbound traffic.

## Network Interface
- Creates a network interface within the subnet with a specified private IP address.
- Associates the security group with the network interface.

## Elastic IP (EIP)
- Assigns an Elastic IP to the network interface created above.

## Ubuntu Server Instance
- Launches an Ubuntu server instance with Apache2 installed and enabled.
- Configures Apache2 to serve a basic HTML page.
- Tags the instance as "web-server".

This infrastructure setup provides a foundation for hosting a web application on AWS, ensuring network isolation, security group configurations, and a basic web server environment.
