# Define the provider block with AWS credentials and region
provider "aws"{
    region     = "us-east-1"
    access_key = "my_access_key"
    secret_key = "my_secret_key"
}

#1. Create a Virtual Private Cloud (VPC) with a specified CIDR block and tags
resource "aws_vpc" "first-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "production"
    }
}

#2. Create an internet gateway and attach it to the VPC
resource "aws_internet_gateway" "gw"{
    vpc_id = aws_vpc.first-vpc.id
}

#3. Create a custom route table for the VPC and configure it to route all traffic through the internet gateway
resource "aws_route_table" "prod-route-table"{
    vpc_id = aws_vpc.first-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    route {
        ipv6_cidr_block = "::/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "Prod"
    }
}

#4. Create a subnet within the VPC with a specified CIDR block and availability zone
resource "aws_subnet" "subnet-1" {
    vpc_id            = aws_vpc.first-vpc.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "prod-subnet"
    }
}

#5. Associate the subnet with the custom route table to control the routing within the VPC
resource "aws_route_table_association" "a"{
    subnet_id      = aws_subnet.subnet-1.id
    route_table_id = aws_route_table.prod-route-table.id
}

#6. Create a security group to allow inbound traffic on ports 22, 80, and 443, and all outbound traffic
resource "aws_security_group" "allow_web" {
    name        = "allow_web_traffic"
    description = "Allow web inbound traffic and all outbound traffic"
    vpc_id      = aws_vpc.first-vpc.id

    tags = {
        Name = "allow_web"
    }
}

# Allow SSH (port 22) traffic from any source
resource "aws_security_group_rule" "allow_ssh" {
    type              = "ingress"
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.allow_web.id
}

# Allow HTTP (port 80) traffic from any source
resource "aws_security_group_rule" "allow_http" {
    type              = "ingress"
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.allow_web.id
}

# Allow HTTPS (port 443) traffic from any source
resource "aws_security_group_rule" "allow_https" {
    type              = "ingress"
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.allow_web.id
}

# Allow all outbound traffic from the security group
resource "aws_security_group_rule" "allow_all_egress" {
    type              = "egress"
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.allow_web.id
}

#7. Create a network interface within the subnet with a specified private IP address and associated security group
resource "aws_network_interface" "web_server-nic" {
    subnet_id       = aws_subnet.subnet-1.id
    private_ips     = ["10.0.1.50"]
    security_groups = [aws_security_group.allow_web.id]
}

#8. Assign an Elastic IP (EIP) to the network interface created in step 7
resource "aws_eip" "one" {
    vpc                = true
    instance           = aws_instance.web-server-instance.id
}

#9. Launch an Ubuntu server instance with Apache2 installed and enabled
resource "aws_instance" "web-server-instance" {
    ami             = "ami-0c7217cdde317cfec"
    instance_type   = "t2.micro"
    availability_zone = "us-east-1a"
    key_name        = "terraform_practice"

    network_interface {
        network_interface_id = aws_network_interface.web_server-nic.id
        device_index         = 0  # Set the device index to 0 or another appropriate value
    }

    user_data = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo bash -c 'echo "Your very first web server" > /var/www/html/index.html'
    EOF

    tags = {
        Name = "web-server"
    }
}
