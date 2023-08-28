provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "k8s_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "k8s_vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = azurerm_resource_group.k8s_rg.location
  resource_group_name = azurerm_resource_group.k8s_rg.name
}

resource "azurerm_subnet" "k8s_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.k8s_rg.name
  virtual_network_name = azurerm_virtual_network.k8s_vnet.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.k8s_rg.location
  resource_group_name = azurerm_resource_group.k8s_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.default_node_pool_node_count
    vm_size    = var.default_node_pool_vm_size
  }

  network_profile {
    network_plugin = var.aks_network_plugin
    service_cidr   = var.aks_service_cidr
    dns_service_ip = var.aks_dns_service_ip
  }

  tags = var.aks_tags
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name                  = var.aks_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = var.aks_node_pool_vm_size
  node_count            = var.aks_node_pool_node_count
  orchestrator_version  = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version

  os_disk_size_gb = var.aks_node_pool_os_disk_size_gb
}