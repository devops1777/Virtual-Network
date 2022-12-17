terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.36.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "Tarun-RG2-VN" {
  name = "Tarun-VN"
  location = "UK South"
}

resource "azurerm_network_security_group" "Tarun-NSG" {
  name = "Tarun-NSG"
  resource_group_name = azurerm_resource_group.Tarun-RG2-VN.name
  location = azurerm_resource_group.Tarun-RG2-VN.location
}

resource "azurerm_virtual_network" "Tarun-VN" {
  name = "Tarun-VN"
  resource_group_name = azurerm_resource_group.Tarun-RG2-VN.name
  location = azurerm_resource_group.Tarun-RG2-VN.location
  address_space = [ "10.0.0.0/16" ]
  dns_servers = [ "10.0.0.4", "10.0.0.5"]

  subnet {
    name = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.Tarun-NSG.id
  }

  tags = {
    environment = "Production"
  }
}