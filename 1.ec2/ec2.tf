


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allowing SSH Access"


    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
    Createdby="Lingaiah"
  }

}

resource "aws_instance" "db" {
  ami           = "ami-041e2ea9402c46c32"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "HelloWorld-db"
  }
}