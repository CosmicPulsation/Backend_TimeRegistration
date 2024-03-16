
var resourceGroupName = 'Timeregistration-UI'
var resourceGroupLocation = 'westeurope'


resource deployresourcegroop 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}