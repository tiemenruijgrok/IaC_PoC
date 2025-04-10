@description('Naam van de Log Analytics Workspace')
param name string

@description('Locatie van de Log Analytics Workspace')
param location string

@description('Generated from /subscriptions/6c516f03-07d2-44c8-8ab5-15d92d64f2f5/resourceGroups/PoC/providers/Microsoft.OperationalInsights/workspaces/PoC-Workspace')
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  properties: {
    sku: {
      name: 'pergb2018'
    }
    retentionInDays: 30
    features: {
      legacy: 0
      searchVersion: 1
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: -1
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
  location: location
  tags: {}
  name: name
}

output workspaceId string = logAnalytics.id
