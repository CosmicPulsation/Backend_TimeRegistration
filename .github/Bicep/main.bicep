targetScope='subscription'

param resourceGroupLocation string =  'westeurope'
param resourceGroupName string = 'Timeregistration-UI'

resource deployResourceGroop 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  scope: deployResourceGroop
  name: 'test-deploy'
  location: resourceGroupLocation
  sku: {
    name: 'F1'
  }
  kind: 'windows'
}