resource "aws_organizations_organization" "root" {
  feature_set = "ALL"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Codesmithy"

  cidr            = "10.0.0.0/16"
  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "ecs_cluster" {
  source = "./modules/ecs_cluster"

  name = "2DAVE"
}

data "aws_ami" "amazon_linux_ecs" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

module "ec2_profile" {
  source = "./modules/ec2_profile"

  name_prefix = "2DAVE"
}

module "asg" {
  source = "./modules/asg"

  name_prefix     = "2DAVE"
  image_id        = data.aws_ami.amazon_linux_ecs.id
  instance_type   = "t2.micro"
  subnets         = module.vpc.public_subnets
  security_groups = [module.vpc.default_security_group_id]
  key_name        = "2DAVE"
  ec2_profile_arn = module.ec2_profile.iam_instance_profile_arn
  cluster_name    = module.ecs_cluster.cluster_name
}

module "task_definition" {
  source = "./modules/ecs_task_definition"

  name     = "2DAVE"
  log_name = "2dave"
  app_name = "app"
  repo_url = module.ecs_repo.endpoint_url
}

module "service" {
  source = "./modules/ecs_service"

  name                = "2DAVE"
  cluster_id          = module.ecs_cluster.cluster_id
  task_definition_arn = module.task_definition.task_definition_arn
}

module "ecs_repo" {
  source = "./modules/ecs_repo"

  name = "app_2dave"
}
