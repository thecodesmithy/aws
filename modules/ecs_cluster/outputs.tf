output "cluster_name" {
  value       = aws_ecs_cluster.this.name
  description = "The name of this ECS cluster"
}

output "cluster_id" {
  value       = aws_ecs_cluster.this.id
  description = "The ID of this ECS cluster"
}
