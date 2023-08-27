variable "region" {
  #default region to deploy infrastructure
  type    = string
  default = "eu-central-1"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone where the infrastructure will be deployed"
  default     = "eu-central-1a"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "publicCIDR" {
  type    = string
  default = "10.0.1.0/24"
}

variable "environment" {
  default = "dev"
}
variable "instance_type" {
  #default instance_type to deploy
  type    = string
  default = "t2.micro"
}

variable "instance_AMI" {
  #default instance_type to deploy
  type    = string
  default = "ami-05d34d340fb1d89e5"
}

variable "instance_tag" {
  #default instance_type to deploy
  type    = string
  default = "My Amazon Linux Server"
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["80", "443", "22", "8080"]
}
