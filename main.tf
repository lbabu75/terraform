provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("ec2keyp.pub")
}
