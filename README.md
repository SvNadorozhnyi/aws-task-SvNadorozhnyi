# Task on the topic AWS and Terraform

## Task

You should develop a Terraform code in **main.tf** that implements predefined variables used to deploy infrastructure on AWS. <br>
Your task is to review the variables and their descriptions, and deploy designed infrastructure using additional needed resources, <br>
such as **aws_internet_gateway**, **aws_route_table**, **aws_route_table_association** and **aws_security_group**. <br>

The variables defined in the code (./Source/variables.tf) are as follows:<br>

| **Variable**  | **Description** |
| --- | --- |
| **region** | The AWS region where the infrastructure will be deployed. The default value is "eu-central-1"  |
| **availability_zone**  | The availability zone where the infrastructure will be deployed. The default value is "eu-central-1a"  |
| **cidr**  | The CIDR block for the VPC. The default value is "10.0.0.0/16" |
| **publicCIDR**  | A list of CIDR blocks for the public subnets. The default value is ["10.0.1.0/24"].  |
| **environment**  | The environment where the infrastructure will be deployed. The default value is "dev"  |
| **instance_type**  | The instance type to be used for the EC2 instance. The default value is "t2.micro"  |
| **instance_AMI**  | The AMI ID of the instance to be launched. The default value is "ami-05d34d340fb1d89e5"  |
| **allowed_ports**  | A list of allowed ports. The default value is ["80", "443", "22", "8080"]  |

Also you should develop respective **ouputs.tf** with following information about created resources: <br>

**output "ec2_public_ip" {put your code here}**<br>
**output "ec2_ami" {put your code here}**<br>
**output "ec2_type" {put your code here}**<br>
**output "public_vpc_id" {put your code here}**<br>
**output "ec2_subnet_id" {put your code here}**<br>
**output "public_subnet_AZ" {put your code here}**<br>
**output "ec2_region" {put your code here}**<br>

After your code will be developed you need to make several steps to complete this task: <br>

1. Install Terraform (or it could be already installed)<br>
2. Run terraform init, plan and finally apply in your directory with your terrafom files.<br>
3. Be sure, that you have properly configured AWS credentials, beacause it is required.<br>
4. After successfully completing you should run terraform output and save its result as a file **result**. <br>


# Short overview

This Terraform code defines infrastructure resources for a VPC and EC2 instance <br>
with a public subnet, an internet gateway, and a security group for the instance.<br>

The provider for the code is AWS, and it takes the region information from a variable defined in a variables.tf file.<br>

The code defines a VPC resource using the aws_vpc block and sets its CIDR block, instance tenancy, and tags. <br>
It also defines a public subnet using the aws_subnet block, which has a CIDR block, VPC ID, and an availability zone that is set to a variable.<br>

An internet gateway resource is created using the aws_internet_gateway block and is associated with the VPC. <br>
A public route table is defined with a route for all traffic using the internet gateway, using the aws_route_table block.<br>

A route table association resource is created using the aws_route_table_association block to associate the public subnet with the public route table.<br>

Finally, an EC2 instance resource is created with an AMI, instance type, subnet ID, and a user data script to install and start an HTTP server. <br>
A security group is defined for the instance with dynamic ingress rules for specified ports and a default egress rule allowing all traffic.<br>

Overall, this Terraform code provisions a VPC with a public subnet, an internet gateway, <br>
and an EC2 instance with a security group that allows incoming traffic on specified ports.
