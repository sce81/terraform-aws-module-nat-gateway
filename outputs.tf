output "id" {
    value = aws_nat_gateway.main[*].id
}

output "private_ip" {
    value = aws_nat_gateway.main[*].private_ip
}

output "public_ip" {
    value = aws_nat_gateway.main[*].public_ip
}