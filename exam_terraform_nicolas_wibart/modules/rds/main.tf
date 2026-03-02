########################################
# Security Group DB (autorise MySQL depuis le SG web)
########################################

resource "aws_security_group" "db" {
  name        = "${var.project_name}-sg-db"
  description = "Allow MySQL from web SG"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL from web SG"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.web_sg_id]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg-db"
  }
}

########################################
# DB Subnet Group (2 subnets / 2 AZ)
########################################

resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-db-subnets"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnets"
  }
}

########################################
# RDS Instance (MySQL) Multi-AZ
########################################

resource "aws_db_instance" "this" {
  identifier = "${var.project_name}-db"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class    = var.instance_class
  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  multi_az = true

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.db.id]

  publicly_accessible = false
  skip_final_snapshot = true
}