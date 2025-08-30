targetScope = 'subscription'

param env string
param resourceGroupName string
param location string

param owner string
param costCenter string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: '${resourceGroupName}-${env}'
  location: location
  tags: {
    owner: owner
    environment: env
    costCenter: costCenter
  }
}
