resource "aws_ecs_task_definition" "generic" {
  family = "service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn = "arn:aws:iam::303981612052:role/ecsTaskExecutionRole" 
  task_role_arn = "arn:aws:iam::303981612052:role/ecsTaskExecutionRole"
  container_definitions = data.template_file.container_definitions.rendered

#   volume {
#     name      = "service-storage"
#     host_path = "/ecs/service-storage"
#   }
}

data "template_file" "container_definitions" {
  template = "${file("${path.module}/container-definitions.tftpl")}"
  vars = {
    container_name = local.name
    container_image = var.image_uri
    container_port = var.container_port
  }
}