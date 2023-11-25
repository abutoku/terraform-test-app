resource "aws_subnet" "public" {
  for_each = var.public_subnet

  availability_zone       = each.key
  cidr_block              = each.value
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true

  tags = {
    Name   = "${var.name}-public-subnet-${each.key}"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet

  availability_zone = each.key
  cidr_block        = each.value
  vpc_id            = aws_vpc.main.id

  tags = {
    Name   = "${var.name}-private-subnet-${each.key}"
  }
}

resource "aws_subnet" "restrict" {
  for_each = var.restrict_subnet

  availability_zone = each.key
  cidr_block        = each.value
  vpc_id            = aws_vpc.main.id

  tags = {
    Name   = "${var.name}-restrict-subnet-${each.key}"
  }
}