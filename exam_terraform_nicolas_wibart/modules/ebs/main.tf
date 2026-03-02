########################################
# Volume EBS + attachement à l'EC2
########################################

resource "aws_ebs_volume" "this" {
  availability_zone = var.availability_zone
  size              = var.size
  type              = "gp3"

  tags = {
    Name = "${var.project_name}-ebs"
  }
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.this.id
  instance_id = var.instance_id
}