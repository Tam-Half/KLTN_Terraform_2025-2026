variable "aws_name_vpc" {
    type = string
    default = "vpc_kltn"
    description = ""
}

variable "subnet_azs" {
    type = list(string)
    default = [ "us-east-1a" ]
}
