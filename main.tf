resource "azurerm_resource_group" "RG" {
    name     = "revert-commit-test-rg"
    location = "eastus"
    managed_by = "user"

}
resource "azurerm_storage_account" "SA" {
    name                     = "revertcommittestsa"
    resource_group_name      = azurerm_resource_group.RG.name
    location                 = azurerm_resource_group.RG.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}
resource "azurerm_storage_container" "SC" {
    name                  = "revert-commit-test-container"
    storage_account_id    = azurerm_storage_account.SA.id
    container_access_type = "private"
}