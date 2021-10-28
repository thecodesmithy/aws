variable "name_prefix" {
  type        = string
  description = "The prefix to assign to this auto-scaling group and it's resources"
}

variable "image_id" {
  type        = string
  description = "The AMI ID this ASG will use when creating an EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "The size of the EC2 instance this ASG will create i.e. t2.micro by default"
  default     = "t2.micro"
}

variable "subnets" {
  type        = list(string)
  description = "The names of the VPC subnets that make up this ASG's VPC zone"
}

variable "key_name" {
  type        = string
  description = "The name of the key used to encrypt and provide SSH access"
}

variable "security_groups" {
  type        = list(string)
  description = "The names of the security groups bound to this EC2"
}

variable "cluster_name" {
  type        = string
  description = "The name of the ECS cluster"
}

variable "ec2_profile_arn" {
  type        = string
  description = "The ARN of the EC2 instance profile"
}
