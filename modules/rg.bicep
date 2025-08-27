targetScope = 'subscription'

param env string
param resourceGroupName string
param location string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: '${resourceGroupName}-${env}'
  location: location
}
