output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "web_sg_id" {
  value = aws_security_group.web.id
}

output "public_subnet_azs" {
  value = aws_subnet.public[*].availability_zone
}