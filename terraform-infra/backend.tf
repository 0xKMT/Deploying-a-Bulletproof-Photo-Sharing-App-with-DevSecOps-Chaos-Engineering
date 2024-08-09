terraform {
  backend "s3" {
    bucket = "0xkmt-devsecops-backend-codedevops"
    key    = "secops-dev.tfstae"
    region = "ap-southeast-1"
  }
}

