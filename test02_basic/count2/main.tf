# terraform_example/test02_basic/count2/main.tf

locals {
    students_list = ["kim", "lee", "park"]
}

resource "local_file" "student_notes" {
    count = length(local.students_list)
    filename = "${path.module}/student_${local.students_list[count.index]}.txt"
    content = "hi ${local.students_list[count.index]} student's note"
}

output "debug" {
    value = local_file.student_notes[*].filename
}