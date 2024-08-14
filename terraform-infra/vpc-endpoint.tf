resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = var.ssm_endpoint_service_name
  vpc_endpoint_type = "Interface"
  tags = {
    Name        = "${local.project}-${var.env}-vpce"
    environment = "${var.env}"
  }

  subnet_ids = [
    aws_subnet.private_ap_southeast_1a.id,
    aws_subnet.private_ap_southeast_1b.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

}

resource "aws_vpc_endpoint_private_dns" "ssm" {
  vpc_endpoint_id     = aws_vpc_endpoint.ssm.id
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm-messages" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = var.ssm_messages_endpoint_service_name
  vpc_endpoint_type = "Interface"
  tags = {
    Name        = "${local.project}-${var.env}-vpce"
    environment = "${var.env}"
  }

  subnet_ids = [
    aws_subnet.private_ap_southeast_1a.id,
    aws_subnet.private_ap_southeast_1b.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

}

resource "aws_vpc_endpoint_private_dns" "ssm-messages" {
  vpc_endpoint_id     = aws_vpc_endpoint.ssm-messages.id
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2-messages" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = var.ec2_messages_endpoint_service_name
  vpc_endpoint_type = "Interface"
  tags = {
    Name        = "${local.project}-${var.env}-vpce"
    environment = "${var.env}"
  }

  subnet_ids = [
    aws_subnet.private_ap_southeast_1a.id,
    aws_subnet.private_ap_southeast_1b.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

}

resource "aws_vpc_endpoint_private_dns" "ec2-messages" {
  vpc_endpoint_id     = aws_vpc_endpoint.ec2-messages.id
  private_dns_enabled = true
}

resource "aws_security_group" "vpc_endpoint" {
  name        = "devsecops_prj_vpc_endpoint"
  description = "SG VPC Endpoint"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name        = "${local.project}-${var.env}-sg"
    environment = "${var.env}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.vpc_endpoint.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
