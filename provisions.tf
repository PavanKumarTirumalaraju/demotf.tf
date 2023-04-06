provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAUR4JVPARYZTIL5J2"
  secret_key = "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"
}
locals {
  common_tags = {
    Name = "RemoteAccess"
  }
}
data "aws_security_group" "testsg"{
    id = "sg-0b9711aac272a7f5d"


}

resource "aws_instance" "web" {
  
  ami             = "ami-04581fbf744a7d11f"
  instance_type   = "t2.micro"
  tags            = local.common_tags
  key_name        = "nnnn1"
  vpc_security_group_ids = [data.aws_security_group.testsg.id]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./nnnn1.pem")

    host = self.public_ip
  }
  provisioner "remote-exec" {
        on_failure = continue
    inline = [
        
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",

      "sudo amazon-linux-extras install epel -y",
      "sudo amazon-linux-extras install java-openjdk11 -y",
      "sudo yum install jenkins -y",
      "sudo service jenkins start",
      "sudo cat  /var/lib/jenkins/secrets/initialAdminPassword"
    ]
  }

}








