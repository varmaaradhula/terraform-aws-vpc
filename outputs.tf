output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.varma_vpc.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.varma-pub-subnet.id
}