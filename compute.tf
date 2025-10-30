resource "azurerm_service_plan" "Azure_service_plan" {
  name                = "Azure_service_plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1"
 
    tags = {
        environment = "Development"
        project     = "Projecto_inicial"
        name        = "Azure_service_plan"
    }

}


resource "azurerm_linux_function_app" "azure_function" {
  name                = "example-linux-function-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.Azure_service_plan.id

  site_config {}

  tags = { 
    environment = "Development"
    project     = "Projecto_inicial"
    name        = "example-linux-function-app"
  }
}



resource "azurerm_container_app_environment" "container_environment" {
  name                       = "container-app-env"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
}

resource "azurerm_container_app" "Azure_container_app" {
  name                         = "container_app"
  container_app_environment_id = azurerm_container_app_environment.container_environment.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Single"

  template {
    container {
      name   = "container_app_instance"
      image  = "--YOUR_CONTAINER_IMAGE--"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
  tags = { 
    environment = "Development"
    project     = "Projecto_inicial"
    name        = "container_app"
    }
}



resource "azurerm_network_interface" "Interface_machine" {
  name                = "example-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Machine_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "Maquinas_Virtuales" {
  name                = "Maquinas-Vir"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.Interface_machine.id,
  ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  tags = {
    environment = "Development"
    project     = "Projecto_inicial"
    name        = "Maquinas_Virtuales"
  }
}