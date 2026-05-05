resource "aws_instance" "reverse_proxy" {
  ami              = var.aws_ami
  instance_type    = var.aws_instance_type
  subnet_id = var.public_subnet
  vpc_security_group_ids  = [aws_security_group.ec2_sg.id]
  key_name = var.keypair_name
  # Public IPv4
  associate_public_ip_address = true
  tags = {
    Name = "reverse_proxy"
  }
}