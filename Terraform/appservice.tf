resource "azurerm_resource_group" "rg" {
  name     = "sshtechrg"
  location = "France Central"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "sshtech-appserviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "service" {
  name                = "sshtech-app-service"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id
  
  source_control {
    rep_url           ="https://github.com/sam1zdat/gs-spring-boot"
    branch            ="master"
    }
 # site_config {
  #  java_version             = "12"
   # scm_type                 = "GitHub"
  #}

  #app_settings = {
  #  "SOME_KEY" = "some-value"
  #}

  #connection_string {
  #  name  = "Database"
  #  type  = "SQLServer"
  #  value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  #}
}
