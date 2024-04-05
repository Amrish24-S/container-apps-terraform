resource "azurerm_container_app" "container_app_back" {
  name = var.app1

  container_app_environment_id = azurerm_container_app_environment.app_environment.id
  resource_group_name          = azurerm_resource_group.resource_group.name
  revision_mode                = "Single"

  registry {
    server = "docker.io"
    username = "amrish24"
    password_secret_name = "password"
  }

  template {
    container {
      name   = "ter-ca-java"
      image  = "amrish24/container-app:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
  workload_profile_name = "Consumption"

  ingress {
    allow_insecure_connections = false
    target_port                = 8080
    transport                  = "auto"
    traffic_weight {
      percentage = 100
      latest_revision  = true
    }
  }

  secret { 
    name  = "password" 
    value = "Docker@2409" 
  }
}

resource "azurerm_container_app" "container_app_front" {
  name = var.app2

  container_app_environment_id = azurerm_container_app_environment.app_environment.id
  resource_group_name          = azurerm_resource_group.resource_group.name
  revision_mode                = "Single"

  registry {
    server = "docker.io"
    username = "amrish24"
    password_secret_name = "password"
  }

  template {
    container {
      name   = "ter-ca-node"
      image  = "amrish24/container-app-front:latest"
      cpu    = 0.25
      memory = "0.5Gi"
      env {
        name  = "API_BASE_URL"
        value = "https://${azurerm_container_app.container_app_back.latest_revision_fqdn}"
      }
    }
  }
  workload_profile_name = "Consumption"

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 3000
    transport                  = "auto"
    traffic_weight {
      percentage = 100
      latest_revision  = true
    }
  }
  secret { 
    name  = "password" 
    value = "Docker@2409" 
  }
}