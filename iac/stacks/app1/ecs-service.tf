module "ecs_service" {
  source = "../../modules/ecs-service-fargate-replica"
  environment = var.environment
  product_name = local.product_name
  app_name = local.app_name
  cluster_id = data.aws_ecs_cluster.ecs.id
  listener_arn = data.aws_lb_listener.http.arn
  image_uri = "303981612052.dkr.ecr.eu-central-1.amazonaws.com/my-app:latest"
  vpc_id = data.aws_vpc.default_vpc.id
}