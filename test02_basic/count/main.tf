# terraform_example/test02_basic/count/main.tf

resource "local_file" "student_notes" {
    count = 3

    filename = "${path.module}/student_${count.index + 1}.txt"
    content = "hi ${count.index + 1} student's note"
}

output "debug01" {
    value = local_file.student_notes[0].filename
}
output "debug02" {
    value = local_file.student_notes[1].filename
}
output "debug03" {
    value = local_file.student_notes[2].filename
}
output "debug_all" {
    value = local_file.student_notes[*].filename
}