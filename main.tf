provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = "t3.micro"
  subnet_id              = "subnet-08b94a90d64460b12"
  vpc_security_group_ids = ["sg-06558ebd94c10cd69"]

  tags = {
    Name = "Netflix-EC2"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "bhavesh-netflix-2026-unique-1008"
}

resource "aws_s3_object" "image" {
  bucket = aws_s3_bucket.bucket.id
  key    = "netflix-image.tar"
  source = "/tmp/netflix-image.tar"
}

resource "aws_s3_object" "code" {
  bucket = aws_s3_bucket.bucket.id
  key    = "main.tf"
  source = "${path.module}/main.tf"
}
