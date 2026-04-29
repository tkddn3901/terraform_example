# test02_basic/for/main.tf

variable "user_list" {
    type = list(string)
    default = [ "alice", "bob", "david", "scott", "json" ]
}

output "debug01_user_list" {
    value = [for item in var.user_list : item]
}

output "debug02_user_list2" {
    value = [for item in var.user_list : upper(item)]
}

output "debug03_user_list3" {
    value = [for item in var.user_list : item if length(item) <= 4]
}

output "debug04_user_list4" {
    value = { for name in var.user_list : name => "IAM-USER-${name}" }
}

output "debug05_user_list5" {
    value = [ for index, item in var.user_list : "${index+1}번째 사용자 : ${item}" ]
}

output "debug06_user_list6" {
    value = { for index, item in var.user_list : index => item }
}

output "debug07_multiline" {
    value = <<-EOT
        #!/bin/bash
        dnf update -y
        dnf install -y nginx
        systemctl enable nginx
        systemctl start nginx
    EOT
}