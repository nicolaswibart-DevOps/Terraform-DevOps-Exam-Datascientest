########################################
# Variables RDS
########################################

variable "project_name" {
  description = "Nom du projet (tags)"
  type        = string
}

variable "db_name" {
  description = "Nom de la base"
  type        = string
}

variable "db_username" {
  description = "Utilisateur DB"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Mot de passe DB"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "2 subnets (dans 2 AZ) pour le subnet group RDS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID (pour créer le SG DB)"
  type        = string
}

variable "instance_class" {
  description = "Type d'instance RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "web_sg_id" {
  description = "Security group du serveur web (source autorisée)"
  type        = string
}