# test10_route53/route53.tf


# 아래의 코드는 route53의 호스팅 영역에 domain name을 등록하고
# 설정만 잘해 놓으면 바꿀게 없다(그대로 사용 가능)
# 단지 ${var.domain_name}이 잘 참조될 수 있도록 domain name만 변수로 지정하면 된다.


# 1. Route53 호스팅 영역에 등록된 도메인 정보 조회
data "aws_route53_zone" "selected" {
    name = "${var.domain_name}." # 뒤에 반드시 .을 붙여야 한다
    private_zone = false # public 영역의 도메인이기 때문
}

# 2. ACM 인증서 발급 신청
resource "aws_acm_certificate" "cert" {
    domain_name       = "*.${var.domain_name}" # 서브도메인용 (*.gmfrd.store)
    validation_method = "DNS"
    
    # 루트 도메인(gmfrd.store)도 함께 보호
    subject_alternative_names = [var.domain_name]

    lifecycle {
        create_before_destroy = true
    }

    tags = {
        Name = "lecture-certificate"
    }
}

# 3. DNS 검증용 레코드 생성
resource "aws_route53_record" "cert_validation" {
    # 인증서의 도메인 검증 옵션들을 반복문 돌면서 하나씩 꺼내서 map으로 변환
    for_each = {
        for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
        name   = dvo.resource_record_name
        record = dvo.resource_record_value
        type   = dvo.resource_record_type
        }
    }

    allow_overwrite = true
    name            = each.value.name
    records         = [each.value.record]
    ttl             = 60
    type            = each.value.type
    zone_id         = data.aws_route53_zone.selected.zone_id
}

# 4. 인증서 검증 대기 및 완료(최종 상태 확인)
# 이 리소스가 성공적으로 완료되면 콘솔에서 '발급됨(Issued)' 상태를 볼 수 있습니다.
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

# 5. 발급된 인증서의 arn 확인(출력)
output "certificate_arn" {
    value = aws_acm_certificate_validation.cert.certificate_arn
}