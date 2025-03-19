
output "vpc_id" {
  description = "ID da VPC criada"
  value = module.vpc.vpc_id
}

output "cluster_name" {
  description = "Nome do cluster EKS criado"
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS criado"
  value = module.eks.cluster_endpoint
}

output "app_service_endpoint" {
  description = "Endpoint do serviço da aplicação"
  value = module.app.app_service_endpoint
}

output "ingress_host" {
  description = "Host do ingress criado"
  value = module.app.ingress_host
}