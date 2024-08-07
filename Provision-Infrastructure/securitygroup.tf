# create security group for the ec2 instance
resource "aws_security_group" "socks_shop_vpc" {
  name        = "ec2 security group"
  description = "allow access on ports 8080 and 22"
  vpc_id      = "socks_shop_vpc.public.id"

  # allow access on port 8080
  ingress {
    description = "http proxy access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow access on port 22
  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }

  tags = {
    Name = "jenkins-server-security-group"
  }
}
