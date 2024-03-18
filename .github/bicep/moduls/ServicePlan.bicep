param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {

  name: 'test-deploy'
  location: location
  sku: {
    name: 'F1'
  }
  kind: 'windows'
}

resource symbolicname ' @2022-09-01' = {
    name: 'Time-Registration'
    location: location
    properties:{
        serverFramId: appServicePlan.id
    }
}