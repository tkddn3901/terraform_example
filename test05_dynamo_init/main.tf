# main.tf

terraform {
    required_version = ">= 1.14.0" # github action에서 에러 나지 않게 수정
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>6.0"
        }
    }
}

resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform-lock" # 테이블명(원하는 대로)
    billing_mode = "PAY_PER_REQUEST" # 비용 지불 방식(요청 갯수당 과금)
    hash_key = "LockID" # 카테고리명(원하는 대로)

    # 속성을 이용해서
    attribute {
        name = "LockID" # 카테고리의
        type = "S" # 데이터 type을 설정(S는 문자열, N은 숫자)
    }
    tags = {
        Name = "Terraform State Lock Table"
    }
}