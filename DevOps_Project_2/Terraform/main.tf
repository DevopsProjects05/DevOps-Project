resource "aws_security_group" "dev_machine_sg" {
  name        = "dev_machine_sg"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows access from anywhere (restrict as needed)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows access from anywhere (restrict as needed)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-security-group"
  }
}

resource "aws_instance" "dev_machine" {
  ami           = "ami-0df8c184d5f6ae949"
  instance_type = "t2.micro"
  key_name      = "Devsecops"

  tags = {
    Environment = "dev"
    Name        = "${var.name}-server"
  }

  vpc_security_group_ids = [aws_security_group.dev_machine_sg.id] # Attach the security group
}
