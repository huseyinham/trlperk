module "alb" {
  source = "../../modules/alb"
  environment = var.environment
  product_name = local.product_name
  security_group_ids = [aws_security_group.alb.id]
  subnet_ids = data.aws_subnets.subnet_ids.ids
}