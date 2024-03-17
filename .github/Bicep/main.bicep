targetScope='subscription'

param resourceGroupLocation string =  'westeurope'
param resourceGroupName string = 'Timeregistration-UI'

resource deployResourceGroop 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module getServicePlan 'moduls/ServicePlan.bicep' = {
  scope: deployResourceGroop
  name: "ServicePlan"
  params: {
	location: resourceGroupLocation
  }
}