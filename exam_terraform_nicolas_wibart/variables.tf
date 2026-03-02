########################################
# Configuration générale du projet
########################################

# Région AWS de déploiement
variable "aws_region" {
  description = "Région AWS utilisée pour le déploiement"
  type        = string
  default     = "eu-west-3"
}

# Nom du projet (utilisé pour tagger les ressources)
variable "project_name" {
  description = "Nom du projet utilisé dans les tags"
  type        = string
  default     = "datascientest-wp"
}

########################################
# Configuration EC2
########################################

# Type d'instance EC2 pour le serveur web
variable "instance_type" {
  description = "Type d'instance EC2 pour Wordpress"
  type        = string
  default     = "t3.micro"
}

# Nom de la key pair AWS existante
# (permet de se connecter en SSH à l'instance)
variable "ssh_key_name" {
  description = "Nom de la key pair AWS existante"
  type        = string
}

########################################
# Configuration base de données (RDS)
########################################

# Nom de la base de données
variable "db_name" {
  description = "Nom de la base de données Wordpress"
  type        = string
  default     = "wordpress"
}

# Utilisateur de la base de données
variable "db_username" {
  description = "Nom d'utilisateur pour la base de données"
  type        = string
  sensitive   = true
}

# Mot de passe de la base de données
variable "db_password" {
  description = "Mot de passe de la base de données"
  type        = string
  sensitive   = true
}

########################################
# Configuration EBS
########################################

# Taille du volume EBS supplémentaire (en Go)
variable "ebs_size" {
  description = "Taille du volume EBS pour la persistance des données"
  type        = number
  default     = 10
}