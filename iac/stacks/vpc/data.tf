data "aws_vpc" "default_vpc" {
    default = true
}

data "aws_subnets" "subnet_ids" {
    filter {
        name   = "vpc-id"
        values = [data.aws_vpc.default_vpc.id]
    }
}
