output "ec2_public_ip" {
  description = "IP publique du serveur Wordpress"
  value       = module.ec2.public_ip
}

output "rds_endpoint" {
  description = "Endpoint de la base RDS"
  value       = module.rds.endpoint
}