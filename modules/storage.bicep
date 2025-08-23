targetScope = 'resourceGroup'

param storageAccountName string
param location string
param skuName string
param kind string

resource storageAccount 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: kind
}
