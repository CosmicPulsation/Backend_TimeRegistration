param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {

  name: 'test-deploy'
  location: location
  sku: {
    name: 'F1'
  }
  kind: 'windows'
}