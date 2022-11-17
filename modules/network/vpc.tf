resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
resource "aws_route_table_association" "us_east_1a_public" {
  subnet_id      = aws_subnet.public_us_east_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "us_east_1b_public" {
  subnet_id      = aws_subnet.public_us_east_1b.id
  route_table_id = aws_route_table.public.id
}


resource "aws_subnet" "public_us_east_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr1
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_us_east_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr2
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "public_us_east_1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr3
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "private_us_east_1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr4
  availability_zone = "us-east-1b"
}

#data "aws_vpc" "main" {
#  vpc_id = aws_vpc.main.id
#}