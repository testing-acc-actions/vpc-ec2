resource "aws_security_group" "ec2" {
  name        = "terraform-vpc-ec2-sg"
  description = "Restricted SSH and HTTP access for learning EC2"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from learner public IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["116.50.59.201/32"]
  }

  ingress {
    description = "HTTP from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound IPv4 traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "terraform-vpc-ec2-sg"
    ManagedBy = "terraform"
  }
}