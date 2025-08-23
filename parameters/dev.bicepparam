using '../main.bicep'


param env = 'dev'
param location = 'swedencentral'
param storageAccountName = 'biceplab-sa'
param appService = 'AppService-dev'
param appServiceName = 'biceplab-as'
param appServicePlanName = 'biceplab-asp'
param appSkuName = 'B1'
param httpsOnly = true
param skuCapacity = 1
param storageSkuName = 'Standard_LRS'
param storageAccount = 'StorageAccount-dev'
param storageKind = 'StorageV2'
