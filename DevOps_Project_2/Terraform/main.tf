

 

resource "aws_instance" "dev_machine" {
  ami = "ami-0df8c184d5f6ae949"
  instance_type = "t2.micro"
  key_name = "Devsecops"

  tags = {
    Environment = "dev"
    Name = "${var.name}-server"
  }
}
