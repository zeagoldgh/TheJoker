resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http"
  vpc_id      = aws_vpc.application-vpc.id

  ingress {
    description = "Http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.allow_http_lb.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

resource "aws_instance" "joke_webserver" {
  ami                         = "ami-094125af156557ca2"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_a.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_http.id]
  key_name                    = "vockey"
  user_data                   = file("script/userdata.sh")
  iam_instance_profile        = "LabInstanceProfile"
}

output "joke_webserver_ip" {
  value =  aws_instance.joke_webserver.public_ip
  description = "Public ip address"
}