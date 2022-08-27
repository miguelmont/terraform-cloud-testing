locals{
    resource_group_name="rg-01"
    location="East US"
    azurerm_virtual_network={
        name="vnet1"
        address_space = "10.0.0.0/16"
        subnet = {
                name="subnet1"
                address_prefix="10.0.1.0/24"        
            }    
        
    }
    networksecuritygroup_rules=[
    {
      priority=200
      destination_port_range="3389"
    },
    {
      priority=300
      destination_port_range="80"
    },
    {
      priority=250
      destination_port_range="22"
    }
  ]
 
}
