# Creación de red
resource "azurerm_virtual_network" "myNet" {
  name                = "kubernetesnetcp2"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  tags = {
    environment = "CP2"
  }
}

# Creación de subnet
resource "azurerm_subnet" "mySubnet" {
  name                 = "terraformsubnetcp2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Crear NIC
resource "azurerm_network_interface" "myNic1" {
  name                = "vmniccp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "myipconfigurationcp2"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          = azurerm_public_ip.myPublicIp1.id
  }
  
  tags = {
    environment = "CP2"
  }
}

# IP pública
resource "azurerm_public_ip" "myPublicIp1" {
  name                = "vmipcp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  
  tags = {
    environment = "CP2"
  }
}
