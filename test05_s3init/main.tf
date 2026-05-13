# s3bucket/main.tf
# version 명시하기
terraform {
  required_version = "~>1.14.0"
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}


# 1. provider 설정
provider "aws" {
    region = "ap-northeast-2" # 서울 리전
}

# s3 버킷 및 IAM 설정(새로 추가할 로직)
resource "random_id" "bucket_suffix" {
    # 4byte 크기의 랜덤한 문자열을 얻기 위한 설정
    byte_length = 4
}

# s3 버킷 정의
resource "aws_s3_bucket" "db_backup_bucket" {
    # s3 버킷의 이름은 전세계에서 유일해야 한다
    # 문자열을 너무 간단히 부여하면 에러가 나면서 만들어지지 않는다
    # 4byte 크기의 random한 16진수를 뒤에 붙여서 겹치지 않는 이름이 나오게 한다
    bucket = "tfstate-bucket-${random_id.bucket_suffix.hex}"
}

output "buckit_id" {
    value = aws_s3_bucket.db_backup_bucket.id
    description = "생성된 s3 버킷의 전역 고유 이름"
}