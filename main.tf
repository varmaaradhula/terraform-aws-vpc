resource "aws_vpc" "varma_vpc" {
  cidr_block       = var.cidr

  tags = {
    Name = "Varma"
  }
}

resource "aws_subnet" "varma-pub-subnet" {
  vpc_id     = aws_vpc.varma_vpc.id
  cidr_block = var.subnet-cidr
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "varma-subnet"
  }
}

resource "aws_internet_gateway" "varma-igw" {
  vpc_id = aws_vpc.varma_vpc.id

  tags = {
    Name = "varma-igw"
  }
}

resource "aws_route_table" "varma-route-table" {
  vpc_id = aws_vpc.varma_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.varma-igw.id
  }

  tags = {
    Name = "varma-RT"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.varma-pub-subnet.id
  route_table_id = aws_route_table.varma-route-table.id
}

