# Este arquivo usa os módulos para criar a infraestrutura completa: VPC, EKS
# e o cluster de Kubernetes. O arquivo main.tf é o arquivo principal do projeto

module "vpc" {
  source = "./terraform-aws-vpc"

  vpc_cidr        = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

module "eks" {
  source = "./terraform-aws-eks"

  cluster_name              = "giropops-cluster"
  cluster_version           = "1.24"
  subnet_ids                = module.vpc.private_subnets
  desired_size              = 2
  max_size                  = 3
  min_size                  = 1
  instance_types            = ["t3.medium"]
}

module "app" {
    source = "./terraform-kubernetes-app"
#    source = "github.com/rany01/terraform-kubernetes-app?ref=v1.0.0"

    cluster_endpoint                         = module.eks.cluster_endpoint
    cluster_certificate_authority_data        = module.eks.cluster_certificate_authority_data
    cluster_token                            = data.aws_eks_cluster_auth.cluster.token
    app_name                                 = "giropops-senhas"
    app_image                                = "rrany/giropops-senhas:4.0"
    app_replicas                             = 2
    app_port                                 = 5000
    redis_host                               = "redis-service"
    app_ingress_host                         = "giropops.rany.fun"
    cert_manager_issuer                      = "letsencrypt-prod"
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}