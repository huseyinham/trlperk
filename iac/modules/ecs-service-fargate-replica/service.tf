resource "aws_ecs_service" "generic" {
  name            = local.name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.generic.arn
  desired_count   = var.desired_count
  # iam_role        = "arn:aws:iam::303981612052:role/ecsTaskExecutionRole"
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.generic.arn
    container_name   = local.name
    container_port   = var.container_port
  }

  network_configuration {
    subnets = data.aws_subnets.subnets.ids
    security_groups = [data.aws_security_group.selected.id]
    assign_public_ip = true
  }

  lifecycle {
    ignore_changes = [ 
      desired_count
     ]
  }
}