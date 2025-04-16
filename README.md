# Projeto Terraform

Este projeto cria uma infraestrutura completa na AWS, incluindo:
- Uma VPC com subnets públicas e privadas.
- Um cluster EKS com um node group.
- Uma aplicação implantada no Kubernetes.

### todo
- ajustar o source do main.tf e linkar ao github/ssh
- terminar de editar o README.md e terraform-docs
- configurar pipeline
- ...

## Como Usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/rany01/???.git
   cd ???



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.93.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app"></a> [app](#module\_app) | github.com/rany01/terraform-kubernetes-app.git | v1.0.0 |
| <a name="module_eks"></a> [eks](#module\_eks) | github.com/rany01/terraform-aws-eks.git | v1.0.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | github.com/rany01/terraform-was-vpc.git | v1.0.1 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Região da AWS onde a infraestrutura será criada | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_endpoint"></a> [app\_service\_endpoint](#output\_app\_service\_endpoint) | Endpoint do serviço da aplicação |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint do cluster EKS criado |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Nome do cluster EKS criado |
| <a name="output_ingress_host"></a> [ingress\_host](#output\_ingress\_host) | Host do ingress criado |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | IDs das subnets privadas criadas |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | IDs das subnets públicas criadas |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID da VPC criada |
<!-- END_TF_DOCS -->