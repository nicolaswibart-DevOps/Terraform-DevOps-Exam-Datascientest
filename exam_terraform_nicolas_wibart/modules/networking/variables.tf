########################################
# Variables networking
########################################

variable "project_name" {
  description = "Nom du projet (tags)"
  type        = string
}

variable "availability_zones" {
  description = "2 Availability Zones pour créer 2 subnets"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR des 2 subnets publics"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}