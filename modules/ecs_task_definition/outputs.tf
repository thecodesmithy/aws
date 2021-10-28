output "task_definition_arn" {
  value       = aws_ecs_task_definition.this.arn
  description = "The ARN of this task definition"
}
