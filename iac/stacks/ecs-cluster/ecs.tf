module "ecs_cluster" {
  source = "../../modules/ecs-cluster"
  environment = var.environment
  product_name = local.product_name
}