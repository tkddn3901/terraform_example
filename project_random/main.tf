terraform {
    required_providers {
        random = {
            source = "hashicorp/random"
            version = "~> 3.0"
        }
    }
}

# 발표 대상 조 명단을 list에 변수 선언
variable "teams" {
    type = list(string)
    default = [ 1, 2, 3, 4, 5, 6 ]
}

resource "random_uuid" "team_shuffle" {
    count = length(var.teams)
    # 실행할 때마다 새롭게 사다리를 탈 수 있도록
    keepers = {
      timestamp = timestamp()
    }
}

# 발표 순서를 배열에 넣어 출력
output "presentation_order" {
    description = "발표 순서"
    value = [ 
        for item in sort([
            for i, name in var.teams : "${random_uuid.team_shuffle[i].result}::::${name}"
        ]) : split("::::", item)[1]
    ]
}