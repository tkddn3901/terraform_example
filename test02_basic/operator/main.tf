# operator/main.tf

variable "env" {
    default = "dev"
}

locals {
    instance_type = var.env == "dev" ? "t3.micro" : "t2.large"
}

output "debug" {
    value = "instance_type은 ${local.instance_type}입니다"
}