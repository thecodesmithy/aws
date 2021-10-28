variable "name" {
  type        = string
  description = "The name of the task definition"
}

variable "log_name" {
  type        = string
  description = "The name of the cloudwatch logs"
}

variable "app_name" {
  type        = string
  description = "The name of the container instance launched by this task definition"
}

variable "repo_url" {
  type        = string
  description = "The URL endpoint of the ECS repository to pull code from"
}
