terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.15"
    }
  }
}

provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      created = "terraform"
    }
  }
}
