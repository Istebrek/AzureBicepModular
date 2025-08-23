using '../main.bicep'


param env = 'test'
param location = 'swedencentral'
param storageAccountName = 'biceplab-sa'
param appService = 'AppService-test'
param appServiceName = 'biceplab-as'
param appServicePlanName = 'biceplab-asp'
param appSkuName = 'B1'
param httpsOnly = true
param skuCapacity = 1
param storageSkuName = 'Standard_LRS'
param storageAccount = 'StorageAccount-test'
param storageKind = 'StorageV2'
