resource "aws_cloudwatch_log_group" "this" {
  name              = "/ecs/${var.log_name}"
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "this" {
  family = var.name

  container_definitions = <<DEFINITION
  [
    {
      "name": "${var.app_name}",
      "cpu": 512,
      "memory": 512,
      "essential": true,
      "image": "${var.repo_url}:latest",
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ],
      "privileged": true
    }
  ]
  DEFINITION

  volume {
    name      = "${var.app_name}-src"
    host_path = "/ecs/${var.app_name}"
  }
}
