resource "azurerm_virtual_network" "vnet1" {
  name                = local.azurerm_virtual_network.name
  address_space       = [local.azurerm_virtual_network.address_space]
  location            = local.location
  resource_group_name = local.resource_group_name
  depends_on = [
    azurerm_resource_group.rg01
  ]
}

resource "azurerm_subnet" "subnet" {
  name                 = local.azurerm_virtual_network.subnet.name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.azurerm_virtual_network.name
  address_prefixes     = [local.azurerm_virtual_network.subnet.address_prefix]
  depends_on = [
    azurerm_virtual_network.vnet1
  ]
}

resource "azurerm_network_security_group" "nsg-01" {
  name                = "nsg-01"
  location            = local.location
  resource_group_name = local.resource_group_name

  dynamic security_rule{
    for_each=local.networksecuritygroup_rules
    content{
      name="Allow-${security_rule.value.destination_port_range}"
      priority=security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  depends_on = [
    azurerm_resource_group.rg01
  ]
}

resource "azurerm_subnet_network_security_group_association" "nsg-01-linked" {
  subnet_id = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg-01.id
  depends_on = [
    azurerm_network_security_group.nsg-01
  ]
}
