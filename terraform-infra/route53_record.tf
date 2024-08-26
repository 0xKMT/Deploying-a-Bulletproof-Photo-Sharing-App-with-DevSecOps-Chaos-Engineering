resource "aws_route53_record" "ui_cf" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "sharecodedevops.labs4aws.click"
  type    = "A"
  alias {
    name                   = module.ui-cf.cloudfront_distribution_domain_name
    zone_id                = module.ui-cf.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }
}