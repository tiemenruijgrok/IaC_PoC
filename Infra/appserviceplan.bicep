@description('Naam van het App Service Plan')
param name string

@description('Locatie van de App Service Plan')
param location string

@description('Generated from /subscriptions/6c516f03-07d2-44c8-8ab5-15d92d64f2f5/resourceGroups/PoC/providers/Microsoft.Web/serverFarms/sample-webapp-idunnocorp')
resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: name
  kind: 'app'
  location: location
  tags: {}
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
  sku: {
    name: 'F1'
    tier: 'Free'
    size: 'F1'
    family: 'F'
    capacity: 0
  }
}

output planId string = appServicePlan.id
