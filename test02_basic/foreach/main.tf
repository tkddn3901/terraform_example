# test02_basic/foreach/main.tf

# 1. 데이터 정의(학생 명단)
locals {
    students = ["kim", "lee"]
}

# 2. for_each를 사용하여 파일 생성
resource "local_file" "student_notes" {
    for_each = toset(local.students)
    filename = "${path.module}/student_${each.key}.txt"
    content = "hi student ${each.value}'s note"
}

output "debug" {
    description = "생성된 파일들의 전체 경로 목록"
    value = [ for item in local_file.student_notes : item.filename ]
}