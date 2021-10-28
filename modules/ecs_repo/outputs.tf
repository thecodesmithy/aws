output "endpoint_url" {
  value       = aws_ecr_repository.this.repository_url
  description = "The URL of this ECS repository"
}
