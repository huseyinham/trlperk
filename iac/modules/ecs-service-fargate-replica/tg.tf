resource "aws_lb_target_group" "generic" {
  name     = "app-tg"
  port     = 5000
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener_rule" "generic" {
  listener_arn = var.listener_arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.generic.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}
