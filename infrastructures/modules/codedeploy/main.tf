# modules/codedeploy/main.tf

variable "application_name" {
  description = "Name of the CodeDeploy application"
  type        = string
}

variable "ecs_service_name" {
  description = "Name of the ECS service to deploy"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

resource "aws_codedeploy_app" "ecs_app" {
  name = var.application_name
  compute_platform = "ECS"
}

resource "aws_codedeploy_deployment_group" "ecs_deployment_group" {
  app_name              = aws_codedeploy_app.ecs_app.name
  deployment_group_name = "${var.application_name}-dg"
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  ecs_service {
    cluster_name = var.ecs_cluster_name
    service_name = var.ecs_service_name
  }

  load_balancer_info {
    target_group_info {
      name = var.target_group_name
    }
  }

  tags = {
    Environment = "production"
  }
}

resource "aws_iam_role" "codedeploy_role" {
  name = "CodeDeployServiceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "codedeploy.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "codedeploy_policy" {
  role       = aws_iam_role.codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

output "codedeploy_app_name" {
  value = aws_codedeploy_app.ecs_app.name
}

output "codedeploy_deployment_group" {
  value = aws_codedeploy_deployment_group.ecs_deployment_group.id
}

