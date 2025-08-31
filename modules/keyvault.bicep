targetScope = 'resourceGroup'

param keyVaultName string
param location string
param skuFamily string
param kvSkuName string
param kvSecretName string
param storageAccountName string
param storageAccountId string

var storageKeys = listKeys(storageAccountId, '2025-01-01')
var connectionString = 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};AccountKey=${storageKeys.keys[0].value};EndpointSuffix=${environment().suffixes.storage}'

resource keyVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: skuFamily
      name: kvSkuName
    }
    accessPolicies: []
  }
}

resource kvSecret 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  name: '${keyVaultName}/${kvSecretName}'
  dependsOn: [ 
    keyVault
  ]
  properties: {
    value: connectionString
  }
}

output secretUri string = kvSecret.properties.secretUriWithVersion
