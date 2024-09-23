# environments/prod/main.tf

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source        = "../../modules/vpc"
  vpc_cidr      = "10.1.0.0/16"
  public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets = ["10.1.101.0/24", "10.1.102.0/24"]
}

module "iam" {
  source = "../../modules/iam"
}

module "security" {
  source           = "../../modules/security"
  vpc_id           = module.vpc.vpc_id
  public_subnets   = module.vpc.public_subnets
}

module "alb" {
  source            = "../../modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnets    = module.vpc.public_subnets
  security_group_id = module.security.alb_sg_id
}

module "ecs" {
  source               = "../../modules/ecs"
  vpc_id               = module.vpc.vpc_id
  private_subnets      = module.vpc.private_subnets
  ecs_task_role_arn    = module.iam.ecs_task_role_arn
  ecs_security_group_id = module.security.ecs_sg_id
  target_group_arn     = module.alb.target_group_arn
}

module "codedeploy" {
  source            = "../../modules/codedeploy"
  application_name  = "app-codedeploy-prod"
  ecs_service_name  = module.ecs.ecs_service_id
  ecs_cluster_name  = module.ecs.ecs_cluster_id
  target_group_name = "app-tg"  # Ensure this matches the target group created in ALB module
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns" {
  value = aws_lb.app_lb.dns_name
}

