# terraform_example/test01/main.tf

terraform {
    required_version = "~>1.14.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>6.0"
        }
    }
}

# 1. povider 설정
provider "aws" {
    region                  = "ap-northeast-2"
}

# 2. vpc 및 네트워크 생성(인프라의 기초 공사)
resource "aws_vpc" "main" {
    cidr_block              = "10.0.0.0/16"
    enable_dns_hostnames    = true
    tags                    = { Name = "lecture-vcp" }
}

# 인터넷 게이트 웨이
resource "aws_internet_gateway" "igw" {
    vpc_id                  = aws_vpc.main.id
    tags                    = { Name = "lecture-igw"}
}

# 현재 리전에서 사용 가능한(availiable) 가용 영역 데이터 가져오기
data "aws_availability_zones" "available" {
    state = "available"
}

# public subnet
resource "aws_subnet" "public_subnet" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = data.aws_availability_zones.available.names[0]
    map_public_ip_on_launch = true
    tags                    = { Name = "lecture-subnet" }
}

# 라우팅 테이블 : 트레픽 이정표
resource "aws_route_table" "public_rc" {
    vpc_id                  = aws_vpc.main.id
    route {
        cidr_block          = "0.0.0.0/0"
        gateway_id          = aws_internet_gateway.igw.id
    }
}

# public subnet을 위의 라우팅 테이블로 연결
resource "aws_route_table_association" "a" {
    subnet_id               = aws_subnet.public_subnet.id
    route_table_id          = aws_route_table.public_rc.id
}

# pem 파일 관련 작업
# 알고리즘 결정
resource "tls_private_key" "pk" {
    algorithm               = "RSA"
    rsa_bits                = 4096
}
# 키 등록
resource "aws_key_pair" "kp" {
    key_name                = "lecture-key"
    public_key              = tls_private_key.pk.public_key_openssh
}
# 개인 키를 가져오기
resource "local_file" "ssh_key" {
    # ${path.module}은 현재 실행 경로를 의미
    filename                = "${path.module}/lecture-key.pem"
    content                 = tls_private_key.pk.private_key_pem
    file_permission         = "0600"
}

# 보안 그룹
resource "aws_security_group" "ssh_sg" {
    # 보안 그룹의 이름은 겹치지 않게 유일한 이름을 지어야 한다
    name                    = "allow-ssh"
    vpc_id                  = aws_vpc.main.id

    # 밖에서 안으로 들어오는 규칙 ingress
    ingress {
        from_port           = 22
        to_port             = 22
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    # 안에서 밖으로 나가는 규칙 egress
    egress {
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
    }
}

# ec2에 설치할 amazon linux 최신 이미지 검색
data "aws_ami" "latest_al2023" {
    most_recent             = true
    owners                  = ["amazon"]
    filter {
      name                  = "name"
      values                = ["al2023-ami-*-x86_64"]
    }   
}

# ec2 만들기
resource "aws_instance" "my_ec2" {
    ami                     = data.aws_ami.latest_al2023.id
    instance_type           = "t3.micro"
    subnet_id               = aws_subnet.public_subnet.id
    vpc_security_group_ids  = [aws_security_group.ssh_sg.id]
    key_name                = aws_key_pair.kp.key_name
    tags = {
        Name                = "my-ec2" 
    }
}