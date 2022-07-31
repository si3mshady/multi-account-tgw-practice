provider "aws" {
  alias   = "dev"
  profile = "dev"
}


resource "aws_default_vpc" "default_vpc" {
    provider = aws.dev
  tags = {
    Name = "Dev VPC"
  }
}


resource "aws_default_subnet" "default_az1" {
    provider = aws.dev
  availability_zone = "us-west-1b"

  tags = {
    Name = "Default subnet for us-west-1b"
  }
}



resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach" {
    provider = aws.dev
  subnet_ids         = [aws_default_subnet.default_az1.id]
  transit_gateway_id = var.tgw_id
  dns_support = "enable"
  vpc_id             = aws_default_vpc.default_vpc.id
}