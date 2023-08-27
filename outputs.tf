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
