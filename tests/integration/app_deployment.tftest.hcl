run "test_app_deployment" {
    command = apply

    # Verificar se o deployment da alicao foi criado
    assert {
      condition = kubernetes_deployment.app.status[0].available_replicas == 2
      error_message = "O deployment da aplicacao não tem 2 réplicas disponíveis"
    }

    # Verificar se o service da aplicacao está acessível
    assert {
      condition = kubernetes_service.app.status[0].load_balancer.ingress[0].hostname != ""
      error_message = "O serviço de aplicacao não tem um endpoint público"
    }
}