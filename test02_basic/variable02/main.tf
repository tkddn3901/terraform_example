# terraform_example/variable02/main.py

# 여러 개의 type을 map에 담고 싶으면 object type을 사용하면 된다
variable "member1" {
    type = object({
        num = number
        name = string
        is_man = bool
    })
    description = "회원 한명의 정보입니다"

    default = {
        num = 1
        name = "kim"
        is_man = true
    }
}

variable "bucket_config" {
    type = object({
        # 반드시 넣어야 하는 값
        name = string
        # 안넣어도 되는 값(optional)
        region = optional(string, "ap-northeast-2")
        # optional 이면서 bool type이고 넣지 않으면 false로 설정
        versioning = optional(bool, false)
    })

    description = "bucket 기본 설정 값"

    default = {
        name = "나의 기본 s3 bucket"
        # region과 versioning은 생략 했으므로 위에 정의한 기본 값이 설정됨
    }
}

output "debug01" {
    value = "회원 정보 : ${var.member1.num}, ${var.member1.name}, ${var.member1.is_man}"
}   

output "debug02" {
    value = "bucket : ${var.bucket_config.name}, ${var.bucket_config.region}, ${var.bucket_config.versioning}"
}