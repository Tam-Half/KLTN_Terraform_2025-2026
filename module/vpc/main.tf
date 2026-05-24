resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.aws_name_vpc
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.8.0/24"
  availability_zone = var.subnet_azs[0]
  tags = {
    Name = "public-subnet-ap-southeast-1a"
  }
}
resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.7.0/24"
  availability_zone = var.subnet_azs[0]
  tags = {
    Name = "private-subnet-ap-southeast-1a"
  }
}

## Create Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "project-rtb-public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "project-rtb-private1-ap-southeast-1a"
  }
}

## set main routetable
resource "aws_main_route_table_association" "set_main" {
  vpc_id = aws_vpc.main.id
  route_table_id = aws_route_table.public.id
}


# resource "aws_route_table_association" "public" {
#   subnet_id      = aws_subnet.public_1a.id
#   route_table_id = aws_route_table.public.id
# }

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private.id
}

##Create Internet Gateway
    resource "aws_internet_gateway" "gw" {
        vpc_id = aws_vpc.main.id
        tags = {
            Name = "project-igw"
        }
    }

    #association route table to igw
    resource "aws_route" "public_internet_access" {
        route_table_id = aws_route_table.public.id
        destination_cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }