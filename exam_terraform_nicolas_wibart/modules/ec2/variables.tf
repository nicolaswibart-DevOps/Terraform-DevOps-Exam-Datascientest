########################################
# Variables EC2
########################################

variable "project_name" {
  description = "Nom du projet (tags)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID à utiliser pour l'instance"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet où déployer l'instance"
  type        = string
}

variable "security_group_id" {
  description = "Security Group pour l'instance"
  type        = string
}

variable "ssh_key_name" {
  description = "Nom de la key pair AWS"
  type        = string
}

variable "user_data_path" {
  description = "Chemin vers le script bash d'installation Wordpress"
  type        = string
}