# Basic Environment Settings
env = "lab"

s3_version = "v5"

ssm_endpoint_service_name = "com.amazonaws.ap-southeast-1.ssm"

ssm_messages_endpoint_service_name = "com.amazonaws.ap-southeast-1.ssmmessages"

ec2_messages_endpoint_service_name = "com.amazonaws.ap-southeast-1.ec2messages"

ecr_names = ["codedevops"]

vpc_config = {
  region                  = "ap-southeast-1"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true
  enable_dns_support      = true
  vpc_cidr_block          = "10.20.0.0/16" #65,536 IPs
  pub_sub1_cidr_block     = "10.20.1.0/24" #256 IPs
  pub_sub2_cidr_block     = "10.20.2.0/24" #256 IPs
  private_sub1_cidr_block = "10.20.3.0/24" #256 IPs
  private_sub2_cidr_block = "10.20.4.0/24" #256 IPs
}

cluster_config = {
  cluster_name    = "codedevops"
  cluster_version = "1.29"
}

ui_conf = {
  cloudfront_default_certificate = true
  ssl_support_method             = "sni-only"
  minimum_protocol_version       = "TLSv1.2_2021"
}
