# arquivo de configuração do provedor da AWS e o backend para armazenar
# o estado do terraform no S3

provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "descomplicando-terraform-rany"
    key    = "giropops-terraform-state"
    region = "us-east-1"
  }
}