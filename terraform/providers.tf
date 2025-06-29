terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
  }
  backend "s3" {
    bucket  = "tfstate-prod-jb-us-east-1-504949722475"
    key     = "rotem/tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY" 
  default_tags {
    tags = {
      Environment = "Production"
      ManagedBy   = "Terraform" 
      Project     = "DemoProject"
      }
  }
}