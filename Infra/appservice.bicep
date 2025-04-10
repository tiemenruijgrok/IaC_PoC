param name string
param location string
param appServicePlanId string
param appInsightsInstrumentationKey string

@description('Generated from /subscriptions/6c516f03-07d2-44c8-8ab5-15d92d64f2f5/resourceGroups/PoC/providers/Microsoft.Web/sites/sample-webapp-idunnocorp-new')
resource appService 'Microsoft.Web/sites@2024-04-01' = {
  name: name
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      linuxFxVersion: ''
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsightsInstrumentationKey
        }
      ]
      numberOfWorkers: 1
      alwaysOn: false
      http20Enabled: false
    }
    httpsOnly: true
    publicNetworkAccess: 'Enabled'
  }
  tags: {
    'hidden-link: /app-insights-instrumentation-key': appInsightsInstrumentationKey
  }
}

output planId string = appService.id
