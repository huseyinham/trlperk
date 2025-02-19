variable "environment" {}
variable "product_name" {}
variable "app_name" {}
variable "cluster_id" {}
variable "listener_arn" {}
variable "image_uri" {}
variable "vpc_id" {}

variable "container_port" {
    default = 5000
}
variable "desired_count" {
    default = 3
}
