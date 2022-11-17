output "vpcid"{
    value = aws_vpc.main.id
}

output "private_subnet_ids1"{
    value = aws_subnet.private_us_east_1a.id
}

output "private_subnet_ids2"{
    value = aws_subnet.private_us_east_1b.id
}

output "public_subnet_ids1"{
    value = aws_subnet.public_us_east_1a.id
}
output "public_subnet_ids2"{
    value = aws_subnet.public_us_east_1b.id
}

output "cidr_block" {
    value = "10.0.0.0/16"
}