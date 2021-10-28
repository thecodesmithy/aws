variable "name" {
  type        = string
  description = "The name of this ECS service"
}

variable "cluster_id" {
  type        = string
  description = "The ID of the ECS cluster that houses this service"
}

variable "task_definition_arn" {
  type        = string
  description = "The ARN of the ECS task definition this service uses"
}
