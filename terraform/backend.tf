terraform {
  backend "s3" {
    bucket = "pfe-s3"
    key    = "pfe/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
