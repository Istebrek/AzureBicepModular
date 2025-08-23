targetScope = 'resourceGroup'

param appServicePlanName string
param appServiceName string
param location string
param skuName string
param skuCapacity int
param httpsOnly bool

// @secure()
// param storageConnectionString string

resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: skuName
    capacity: skuCapacity
  }
}

resource appService 'Microsoft.Web/sites@2024-11-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: httpsOnly
  }

}

output appServiceURL string = 'https://${appService.properties.defaultHostName}'
