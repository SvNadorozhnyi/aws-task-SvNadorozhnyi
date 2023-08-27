provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "public" {
  count             = length(var.publicCIDR)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.publicCIDR[count.index]
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.environment}-public-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.environment}-public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "instance" {
  name_prefix = "${var.environment}-instance-sg-"

  ingress {
    from_port   = var.allowed_ports[0]
    to_port     = var.allowed_ports[length(var.allowed_ports) - 1]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "example" {
  ami           = var.instance_AMI
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public[0].id
  security_groups = [aws_security_group.instance.name]

  tags = {
    Name = "${var.environment}-ec2-instance"
  }
}

output "ec2_public_ip" {
  value = aws_instance.example.public_ip
}

output "ec2_ami" {
  value = var.instance_AMI
}

output "ec2_type" {
  value = var.instance_type
}

output "public_vpc_id" {
  value = aws_vpc.main.id
}

output "ec2_subnet_id" {
  value = aws_subnet.public[0].id
}

output "public_subnet_AZ" {
  value = aws_subnet.public[0].availability_zone
}

output "ec2_region" {
  value = var.region
}
