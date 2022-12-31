
param landingZone object = loadJsonContent('bicep-variables.json')

param location string = resourceGroup().location
param subnetArray array = landingZone.subnets
param vnetPrefixes array = landingZone.vnet.addressPrefixes
param vnetName string = landingZone.vnet.name

module vnet 'virtualNetworks/deploy.bicep' = {
  name: vnetName
  params: {
    addressPrefixes: vnetPrefixes
    name: vnetName
    subnets:subnetArray
    location: location
  }
}
