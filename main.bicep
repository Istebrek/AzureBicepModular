targetScope = 'resourceGroup'

param prod bool
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

param autoScaleName string
param enabledTrue bool
param profileName string
param minCapacity string
param maxCapacity string
param defaultCapacity string
param metricName string
param timeGrain string
param statistic string
param timeWindow string
param triggerOperator string
param triggerThreshold int
param direction string
param triggerOperatorDown string
param triggerThresholdDown int
param directionDown string
param type string
param value string
param nameSpace string
param env string

param keyVault string
param keyVaultName string
param skuFamily string
param kvSkuName string
param kvSecretName string
param storageConnectionString string

module StorageAccount './modules/storage.bicep' = {
  name: storageAccount
  params: {
    location: location
    skuName: storageSkuName
    kind: storageKind
    storageAccountName: '${storageAccountName}${uniqueString(resourceGroup().id)}'
    owner: resourceGroup().name
    costCenter: resourceGroup().name
    env: env
  }
}

module AppService './modules/appservice.bicep' =  {
  name: appService
  params: {
    appServiceName: appServiceName
    appServicePlanName: '${appServicePlanName}-${uniqueString(resourceGroup().id)}'
    httpsOnly: httpsOnly
    location: location
    skuCapacity: skuCapacity
    skuName: appSkuName
    owner: resourceGroup().name
    costCenter: resourceGroup().name
    env: env
    secretUri: KeyVault.outputs.secretUri
    storageConnectionString: storageConnectionString
  }
}

module AutoScale './modules/autoscale.bicep' = if (prod == true) {
  name: autoScaleName
  params: {
    appServicePlanId: AppService.outputs.appServicePlanId
    autoScaleName: autoScaleName
    defaultCapacity: defaultCapacity
    direction: direction
    directionDown: directionDown
    enabledTrue: enabledTrue
    location: location
    maxCapacity: maxCapacity
    metricName: metricName
    minCapacity: minCapacity
    profileName: profileName
    statistic: statistic
    timeGrain: timeGrain
    timeWindow: timeWindow
    triggerOperator: triggerOperator
    triggerOperatorDown: triggerOperatorDown
    triggerThreshold: triggerThreshold
    triggerThresholdDown: triggerThresholdDown
    type: type
    value: value
    nameSpace: nameSpace
    owner: resourceGroup().name
    costCenter: resourceGroup().name
    env: env
  }
}

module KeyVault './modules/keyvault.bicep' = {
  name: keyVault
  params: {
    location: location
    keyVaultName: '${keyVaultName}-${uniqueString(subscription().id)}'
    kvSecretName: kvSecretName
    kvSkuName: kvSkuName
    skuFamily: skuFamily
    storageAccountId: StorageAccount.outputs.storageAccountId
    storageAccountName: StorageAccount.outputs.storageAccountName
  }
}

output appServiceURL string = AppService.outputs.appServiceURL
