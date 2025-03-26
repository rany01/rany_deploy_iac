run "teste_vpc_e_eks_integracao" {
    command = apply

    # Verificar se a VPC foi criada
    assert {
      condition = aws_vpc.this.id != ""
      error_message = "A vpc não foi criada"
    }

    # Verificar se o cluster EKS foi criado
    assert {
      condition = aws_eks_cluster.this.name == "giropops-cluster"
      error_message = "O nome do cluster eks não é 'giropops-cluster'"
    }

    # Verificar se as subnets privadas estão associadas ao cluster EKS
    assert {
      condition = length(aws_eks_cluster.this.vpc_config[0].subnet_ids) == 2
      error_message = "As subnets privadas não estão associadas ao cluster EKS"
    }

    # Verificar se as subnets privadas foram criadas
    assert {
      condition = length(module.vpc.private_subnets) == 2
      error_message = "Número incorreto de subnets privadas"
    }
  
}

run "test_destroy" {
    command = destroy
  
}