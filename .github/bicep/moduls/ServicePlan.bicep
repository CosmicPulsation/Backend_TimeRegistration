param location string

// var repositoryUrl = 'https://github.com/herniklanger/TimeRegistration'
// var branch = 'main'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {

  name: 'test-deploy'
  location: location
  sku: {
    name: 'F1'
  }
  kind: 'windows'
}

resource appService 'Microsoft.Web/sites@2022-09-01' = {
    name: 'tidslog'
    location: location
    properties:{
        serverFarmId: appServicePlan.id
        siteConfig: {
            netFrameworkVersion: 'v8.0'
        }
    }
}

// resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
//   name: '${appService.name}/web'
//   paremt: appService
//   properties: {
//     repoUrl: repositoryUrl
//     branch: branch
//     isManualIntegration: false
//   }
// }