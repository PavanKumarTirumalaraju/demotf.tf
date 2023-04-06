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
  

}





