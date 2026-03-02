########################################
# Variables EBS
########################################

variable "project_name" {
  description = "Nom du projet (tags)"
  type        = string
}

variable "size" {
  description = "Taille du volume EBS (Go)"
  type        = number
  default     = 10
}

variable "availability_zone" {
  description = "AZ où créer le volume (doit matcher l'EC2)"
  type        = string
}

variable "instance_id" {
  description = "ID de l'instance EC2"
  type        = string
}