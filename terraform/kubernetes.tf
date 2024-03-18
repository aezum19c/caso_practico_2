# https://registry.terraform.io/providers/hashicorp/azurerm/2.2.0/docs/resources/kubernetes_cluster
resource "azurerm_kubernetes_cluster" "kubecp2" {
  name                = "akscp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akscp2"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  service_principal {
    client_id       = "2774f7c1-9388-49ea-8b91-d277543762c4"
    client_secret   = "kt18Q~an8uZssK78F11mrCoZWHP3js5LsyX96c5y"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.kubecp2.kube_config.0.client_certificate
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.kubecp2.kube_config_raw
  sensitive = true
}
