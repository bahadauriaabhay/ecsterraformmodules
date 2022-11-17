module "network" {
  source               = "../network"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-tls-${var.name}"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.network.vpcid

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [module.network.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_public" {
  name        = "allow-public-${var.name}"
  description = "Allow Web inbound traffic"
  vpc_id      = module.network.vpcid

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}