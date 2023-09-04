terraform {
  backend "s3" {
    bucket = "terraform-init-state-bucket"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
