variable "client_id" {
  description = "Client ID for service principal"
}

variable "client_secret" {
  description = "Client secret for service principal"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  default     = "k8s-resource-group"
}

variable "location" {
  description = "Azure region for resources"
  default     = "West Europe"
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network"
  default     = "k8s-vnet"
}

variable "virtual_network_address_space" {
  description = "Address space of the Azure Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the Azure Subnet"
  default     = "k8s-subnet"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of the Azure Subnet"
  default     = ["10.0.1.0/24"]
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  default     = "aks-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  default     = "aks-cluster"
}

variable "default_node_pool_vm_size" {
  description = "VM size for the default node pool"
  default     = "Standard_D2s_v3"
}

variable "default_node_pool_node_count" {
  description = "Number of nodes in the default node pool"
  default     = 1
}

variable "aks_node_pool_name" {
  description = "Name of the AKS node pool"
  default     = "nodepool"
}

variable "aks_node_pool_vm_size" {
  description = "VM size for the AKS node pool"
  default     = "Standard_D2s_v3"
}

variable "aks_node_pool_node_count" {
  description = "Number of nodes in the AKS node pool"
  default     = 2
}

variable "aks_node_pool_availability_zones" {
  description = "Availability zones for the AKS node pool"
  default     = ["1", "2", "3"]
}

variable "aks_node_pool_os_disk_size_gb" {
  description = "OS disk size for the AKS node pool"
  default     = 30
}

variable "aks_tags" {
  description = "Tags for the AKS resources"
  type        = map(any)
  default     = { environment = "Dev" }
}

variable "aks_network_plugin" {
  description = "Network plugin for AKS"
  default     = "azure"
}

variable "aks_service_cidr" {
  description = "Service CIDR for AKS"
  default     = "10.2.0.0/24"
}

variable "aks_dns_service_ip" {
  description = "DNS service IP for AKS"
  default     = "10.2.0.10"
}