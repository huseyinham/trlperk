locals {
  name = "${var.environment}-${var.product_name}-${var.app_name}"
  tg_name = "${local.name}-tg"
}