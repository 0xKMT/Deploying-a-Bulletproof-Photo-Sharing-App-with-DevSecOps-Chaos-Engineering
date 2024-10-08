variable "env" {
  type        = string
  description = "The deployment environment name, e.g., 'prod', 'dev', or 'test'."
}

variable "vpc_config" {
  type        = any
  description = "Configuration parameters for the VPC including subnets, CIDR blocks, and other network-related settings."
}

variable "cluster_config" {
  type        = any
  description = "Configuration for the cluster, detailing specifics like size, type, and other cluster-related settings."
}

variable "ui_conf" {
  type        = any
  description = "UI configuration settings, which may include theming, layout, and feature toggles."
}

## ECR
variable "ecr_names" {
  type        = any
  description = "Names of the Elastic Container Registry repositories required for the deployment."
}

variable "ssm_endpoint_service_name" {
  type        = string
  description = "service name for vpc endpoint"
}

variable "ssm_messages_endpoint_service_name" {
  type        = string
  description = "service name for vpc endpoint"
}

variable "ec2_messages_endpoint_service_name" {
  type        = string
  description = "service name for vpc endpoint"
}