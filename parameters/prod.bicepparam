using '../main.bicep'

param env = 'prod'
param location = 'swedencentral'
param storageAccountName = 'biceplab-sa'
param appService = 'AppService-prod'
param appServiceName = 'biceplab-as'
param appServicePlanName = 'biceplab-asp'
param appSkuName = 'S1'
param httpsOnly = true
param skuCapacity = 1
param storageSkuName = 'Standard_LRS'
param storageAccount = 'StorageAccount-prod'
param storageKind = 'StorageV2'
