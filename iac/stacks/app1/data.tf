data "aws_vpc" "default_vpc" {
    default = true
}

data "aws_ecs_cluster" "ecs" {
  cluster_name = "${var.environment}-${local.product_name}"
}

data "aws_lb" "alb" {
  name = "${var.environment}-${local.product_name}"
}

data "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_lb.alb.arn
  port              = 80
}

# data "aws_ecr_image" "app_image" {
#   repository_name = "my_app"
#   image_tag       = "latest" # I would usually make this a TF environment variable so it's easy for CI/CD to override it 
# }