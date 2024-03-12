
var resourceGroupName string = 'Timeregistration-UI'
var resourceGroupLocation string = 'westeurope'


resource deployresourcegroop 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}