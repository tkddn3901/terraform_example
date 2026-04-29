# test02_basic/variable/main.tf

# variable 사용
variable "project_name" {
    default = "lecture"
}

variable "env" {
    default = "dev"
}

# 1. String(문자열type)
# 가장 기본이 되는 문자열 타입. 이름이나 리전 등을 지정할 때 사용
variable "vpc_name" {
    type = string
    description = "vpc의 이름 지정"
    default = "lecture-vpc"
}

# 2. Number(숫자type)
variable "instance_count" {
    type = number
    description = "생성할 인스턴스의 갯수"
    default = 3
}

# 3. List(배열type)
variable "avail_zones" {
    type = list(string)
    description = "사용할 가용 영역 리스트"
    default = [ "ap-northeast-2a", "ap-northeast-2c", "ap-northeast-2d" ]
}

# 4. Map(dict형태)
variable "common_tags" {
    type = map(string)
    description = "모든 리소스에 공통으로 붙일 태그들"
    default = {
      env = "dev"
      project = "terraform-study"
      owner = "kim"
    }
}

# 5. bool(논리type)
variable "is_production" {
    type = bool
    description = "운영 환경이 true, 개발 환경이면 false를 넣으세요"
    default = false
}

output "debug01_project_name" {
    value = var.project_name
}

output "debug02_env" {
    value = var.env
}

output "debug03_info" {
    value = "프로젝트 명 : ${var.project_name}, 환경 : ${var.env}"
}

output "debug04_vpc_name" {
    value = "vpc name : ${var.vpc_name}"
}

output "debug05_count" {
    value = "instance count : ${var.instance_count}"
}

output "debug06_list_all" {
    value = join(",", var.avail_zones)
}

output "debug07_map_value" {
    value = "이 프로젝트의 환경은 ${var.common_tags.env}입니다."
}

output "debug07_map_value2" {
    value = "이 프로젝트의 owner는 ${var.common_tags["owner"]}입니다."
}
