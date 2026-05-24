## Keypair
module "keypair" {
    source            = "../module/keypair"
    key_name          = "ec2_key_ssh"
}

## VPC
module "vpc" {
    source = "../module/vpc"
    aws_name_vpc       = "kltn_vpc"
    subnet_azs         = ["ap-southeast-1a"]
}

## EC2
module "ec2" {
    source             = "../module/ec2"
    aws_instance_type  = "t3.micro"
    aws_ami            = "ami-091138d0f0d41ff90"
    vpc_id             =  module.vpc.vpc_id
    public_subnet      =  module.vpc.public_subnet_ids
    keypair_name       =  module.keypair.key_name
}