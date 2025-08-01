terraform {
  backend "s3" {
    bucket = "value"
    key    = "terraform.tfstate"
    region = "us-east-1"

  }
}
provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  count         = var.core_count
  tags = {
    Name = "ExampleInstance"
  }
}