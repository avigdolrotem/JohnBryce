terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }


  }
  backend "s3" {
    bucket  = "tfstate-prod-jb-us-east-1-504949722475"
    key     = "danny/tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

# terraform init
# terraform plan
# terraform apply
# terraform destroy

# In class: Create your own Bucket and KeyPair
# Self Account - VPC, Bucket,KeyPair