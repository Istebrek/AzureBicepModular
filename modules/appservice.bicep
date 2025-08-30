targetScope = 'resourceGroup'

param appServicePlanName string
param appServiceName string
param location string
param skuName string
param skuCapacity int
param httpsOnly bool

param owner string
param costCenter string
param env string

// @secure()
// param storageConnectionString string

resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: appServicePlanName
  location: location
  tags: {
    owner: owner
    environment: env
    costCenter: costCenter
  }
  sku: {
    name: skuName
    capacity: skuCapacity
  }
}

resource appService 'Microsoft.Web/sites@2024-11-01' = {
  name: appServiceName
  location: location
  tags: {
    owner: owner
    environment: env
    costCenter: costCenter
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: httpsOnly
  }
}

output appServiceURL string = 'https://${appService.properties.defaultHostName}'
output appServicePlanId string = appServicePlan.id
