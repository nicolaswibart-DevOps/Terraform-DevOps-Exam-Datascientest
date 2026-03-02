terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Dispos AZ en eu-west-3
data "aws_availability_zones" "available" {
  state = "available"
}

# AMI Ubuntu 22.04 LTS (simple et stable pour user_data)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "networking" {
  source = "./modules/networking"

  project_name       = var.project_name
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "ec2" {
  source = "./modules/ec2"

  project_name      = var.project_name
  ami_id            = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  subnet_id         = module.networking.public_subnet_ids[0]
  security_group_id = module.networking.web_sg_id
  ssh_key_name      = var.ssh_key_name
  user_data_path    = "${path.module}/install_wordpress.sh"
}

module "ebs" {
  source = "./modules/ebs"

  project_name      = var.project_name
  size              = var.ebs_size
  availability_zone = module.ec2.availability_zone
  instance_id       = module.ec2.instance_id
}

module "rds" {
  source = "./modules/rds"

  project_name = var.project_name

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  subnet_ids     = module.networking.public_subnet_ids
  vpc_id         = module.networking.vpc_id
  web_sg_id      = module.networking.web_sg_id
  instance_class = "db.t3.micro"
}