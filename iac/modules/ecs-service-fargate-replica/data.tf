# data "aws_iam_role" "ecs_task_executor" {
#   name = "ecsTakeExecutionRole"
# }

data "aws_subnets" "subnets" {
    filter {
        name   = "vpc-id"
        values = [var.vpc_id]
    }
}

data "aws_security_group" "selected" {
  name = "alb" # reusing this for ease. in real life, I would use a seperate sg.
}
