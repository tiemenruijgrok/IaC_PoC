param location string
param name string
param workspaceId string

@description('Generated from /subscriptions/6c516f03-07d2-44c8-8ab5-15d92d64f2f5/resourceGroups/PoC/providers/microsoft.insights/components/sample-webapp-idunnocorp-new')
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  kind: 'web'
  etag: '"ed007b51-0000-0200-0000-67f62f440000"'
  name: name
  location: location
  tags: {}
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaWebAppExtensionCreate'
    RetentionInDays: 90
    WorkspaceResourceId: workspaceId
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
    //Ver: 'v2'
  }
}

output instrumentationKey string = appInsights.properties.InstrumentationKey
output appInsightsId string = appInsights.id
