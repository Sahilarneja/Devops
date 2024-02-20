provider "aws" {
    region     = "us-east-1"
    access_key = "my_access_key"
    secret_key = "my_secret_key"
}

# resource "<provider>_<resource_type>" "name"{
#     config options.....
#     key= "value"
#     key2= "another value"
# }

# Deploy EC2 Instance
resource "aws_instance" "myFirstServer" {
    ami           = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"

    tags = {
        Name = "ubuntu"
    }
}

# Terraform Commands:
# - terraform init: Initializes the working directory.
# - terraform plan: Generates an execution plan.
# - terraform apply: Applies changes to infrastructure.
# - terraform destroy: Removes all created infrastructure.

# Provider Configuration:
# - Configure the AWS provider with region and access credentials.

# Define EC2 Instance Resource:
# - Define an EC2 instance with AMI and instance type.

# Deploy EC2 Instance:
# - Initialize Terraform, validate configuration, plan changes, and apply configuration to deploy the EC2 instance.

# Access EC2 Instance:
# - Access the instance via SSH or RDP using the public IP address and credentials.

# Modifying Resources:
# - To update resources, modify the Terraform configuration file and reapply changes using terraform apply.
# - To delete resources, use terraform destroy to remove all created infrastructure.
