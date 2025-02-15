resource "aws_instance" "my_vm" {
  ami           = "ami-0c50b6f7dc3701ddd"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  vpc_security_group_ids = ["sg-0cfab8f6a50ec8ae0"] 

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("ec2keyp.pem")
      host        = self.public_ip
    }
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo docker run -d -p 80:80 nginx"
    ]
  }

  tags = {
    Name = "Terraform-VM3"
  }
}
