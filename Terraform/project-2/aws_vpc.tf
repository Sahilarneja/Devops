# Virtual Private Cloud (VPC) is a fundamental component in AWS, providing a secure, scalable,
# and customizable network infrastructure for cloud resources. It serves as the backbone of 
# cloud architecture, facilitating the deployment and management of various applications and services.

# Summary:
# This Terraform script provisions an AWS VPC named "production" with the CIDR block "10.0.0.0/16". 
# Additionally, it creates a subnet named "prod-subnet" with the CIDR block "10.0.1.0/24" within 
# the VPC. The VPC establishes a virtual network environment for launching AWS resources, while 
# the subnet defines a segmented portion of that network. Metadata tags are applied to both 
# resources to enhance management and identification within the AWS ecosystem.

provider "aws" {
    region     = "us-east-1"
    access_key = "my_access_key"
    secret_key = "my_secret_key"
}

resource "aws_vpc" "first-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "production"
    }
}
# Defines an AWS VPC resource named "first-vpc".
# Specifies the IP address range for the VPC with the CIDR block "10.0.0.0/16".
# Applies metadata tags to the VPC for organizational purposes, tagging it with the name "production".

resource "aws_subnet" "subnet-1" {
    vpc_id     = aws_vpc.first-vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "prod-subnet"
    }
}
# Defines an AWS subnet resource named "subnet-1".
# Specifies the ID of the VPC in which the subnet will be created.
# Specifies the IP address range for the subnet with the CIDR block "10.0.1.0/24".
# Applies metadata tags to the subnet for organizational purposes, tagging it with the name "prod-subnet".
