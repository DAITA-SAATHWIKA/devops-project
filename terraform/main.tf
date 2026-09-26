terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "devops_server" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
  key_name      = "devops-key"

  tags = {
    Name = "DevOps-Server"
  }
}
output "instance_id" {
  value = aws_instance.devops_server.id
}

output "public_ip" {
  value = aws_instance.devops_server.public_ip
}

output "public_dns" {
  value = aws_instance.devops_server.public_dns
}