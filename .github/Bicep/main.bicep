targetScope='subscription'

param resourceGroupLocation string =  'westeurope'
param resourceGroupName string = 'Timeregistration-UI'

resource deployresourcegroop 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}