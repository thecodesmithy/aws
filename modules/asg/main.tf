resource "aws_autoscaling_group" "this" {
  name_prefix = var.name_prefix

  vpc_zone_identifier       = var.subnets
  health_check_type         = "EC2"
  desired_capacity          = 1
  max_size                  = 1
  min_size                  = 1
  wait_for_capacity_timeout = 0

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "this" {
  name_prefix = var.name_prefix

  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups
  user_data              = base64encode(data.template_file.user_data.rendered)

  iam_instance_profile {
    arn = var.ec2_profile_arn
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/templates/user-data.sh")

  vars = {
    cluster_name = var.cluster_name
  }
}
