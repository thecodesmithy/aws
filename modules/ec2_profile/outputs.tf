output "iam_instance_profile_id" {
  value       = aws_iam_instance_profile.this.id
  description = "ID of the IAM instance profile"
}

output "iam_instance_profile_arn" {
  value       = aws_iam_instance_profile.this.arn
  description = "ARN of the IAM instance profile"
}

output "iam_role_id" {
  value       = aws_iam_role.this.id
  description = "ID of the IAM role"
}
