terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0376ec8eacdf70aae"
  instance_type = "t2.micro"
  tags = {
    Name = "tfassignment"
  }
}

output "instance_ip_addr" {
  value = aws_instance.app_server.public_ip
}

resource "aws_s3_bucket" "akiff" {
  bucket = "akiff-s3-bucket-assignment"

  tags = {
    Name        = "My-bucket"
    Environment = "Dev"
  }
}
