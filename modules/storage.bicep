targetScope = 'resourceGroup'

param storageAccountName string
param location string
param skuName string
param kind string

param owner string
param costCenter string
param env string

resource storageAccount 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageAccountName
  location: location
  tags: {
    owner: owner
    environment: env
    costCenter: costCenter
  }
  sku: {
    name: skuName
  }
  kind: kind
}

output storageAccountName string = storageAccount.name
output storageAccountId string = storageAccount.id
