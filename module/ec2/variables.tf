variable "vpc_id" {
    type = string
}

variable "allowed_ssh_ips" {
    description = "My Ip SSH to EC2"
    type = list(string)
    #["MY IP/32"]
    # curl ifconfig.me
    default = [".............../32"]
}

variable "aws_instance_type" {
  type = string
  description = "type of ec2"  
}

variable "aws_ami" {
  type = string
  description = "ami of ec2"  
}

variable "public_subnet" {
  type = string
  description = "Public subnet from vpc output"
}

variable "keypair_name" {
  type = string
  description = "Keypair name of output Keypair"
}