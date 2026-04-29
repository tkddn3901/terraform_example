# test02_basic/foreach2/main.tf

# 1. 데이터 정의(학생 명단)
locals {
    # map을 이용해보자
    students = {
        lee = "이정호"
        kim = "김정호"
        park = "박정호"
    }
}

# 2. for_each를 사용하여 파일 생성(local.students는 map type)
resource "local_file" "student_notes" {
    for_each = local.students
    filename = "${path.module}/student_${each.key}.txt"
    content = "hi student ${each.value}'s note"
}

output "debug" {
    description = "생성된 파일들의 전체 경로 목록"
    value = [ for item in local_file.student_notes : item.filename ]
}