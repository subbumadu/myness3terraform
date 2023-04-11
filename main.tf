provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAVBV5CMEFX34QIPW"
  secret_key = "Lz5ZU3097soiN6UMPuOcm+oTMC35KbDQPFilzjk"
}

terraform {
backend "s3" {
bucket = "devopsfpgpse"
key = "terraform.tfstate"
region = "ap-south-1"
encrypt = true
profile = "devopsfpgpse"
}
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
  acl = "private"
  tags = {
    Name        = "devopsfpgpse"
    Environment = "Dev"
  }
}
output "s3.devopsfpgpse"{
value = aws_s3_bucket.devopsfpgpse.id
}

resource "aws_instance" "instance1" {
  ami           = "ami-07d3a50bd29811cd1"
  instance_type = "t2.micro"
  key = "subbu"

  tags = {
    Name = "instance1"
  }
}


