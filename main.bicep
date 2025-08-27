targetScope = 'resourceGroup'

param env string
param location string
param storageAccount string
param appService string
param storageKind string
param skuCapacity int
param storageSkuName string
param appSkuName string

param storageAccountName string
param appServicePlanName string
param appServiceName string

param httpsOnly bool

module StorageAccount './modules/storage.bicep' = {
  name: storageAccount
  params: {
    location: location
    skuName: storageSkuName
    kind: storageKind
    storageAccountName: '${storageAccountName}-${env}-${uniqueString(resourceGroup().id)}'
  }
}

module AppService './modules/appservice.bicep' = {
  name: appService
  params: {
    appServiceName: '${appServiceName}-${env}'
    appServicePlanName: '${appServicePlanName}-${env}-${uniqueString(resourceGroup().id)}'
    httpsOnly: httpsOnly
    location: location
    skuCapacity: skuCapacity
    skuName: appSkuName
  }
}
