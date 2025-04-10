// main.bicep

param location string = resourceGroup().location
param projectPrefix string = 'verifiedidpoc1'

module logAnalytics 'Infra/Loganalyticworkspace.bicep' = {
  name: 'logAnalyticsModule'
  params: {
    location: location
    name: '${projectPrefix}-law'
  }
}

module appInsights 'Infra/applicationinsights.bicep' = {
  name: 'appInsightsModule'
  params: {
    location: location
    name: '${projectPrefix}-ai'
    workspaceId: logAnalytics.outputs.workspaceId
  }
}

module keyVault 'Infra/keyvault.bicep' = {
  name: 'keyVaultModule'
  params: {
    location: location
    name: '${projectPrefix}-kv'
  }
}

module storageAccount 'Infra/storageaccount.bicep' = {
  name: 'storageAccountModule'
  params: {
    location: location
    name: '${projectPrefix}storage'
  }
}

module blobService 'Infra/blobservice.bicep' = {
  name: 'blobServiceModule'
  params: {
    storageAccountName: storageAccount.outputs.storageAccountName
  }
}

module staticWebsite 'Infra/Staticwebsite.bicep' = {
  name: 'staticWebsiteModule'
  params: {
    storageAccountName: storageAccount.outputs.storageAccountName
  }
}

module appServicePlan 'Infra/appserviceplan.bicep' = {
  name: 'appServicePlanModule'
  params: {
    location: location
    name: '${projectPrefix}-plan'
  }
}

module appService 'Infra/appservice.bicep' = {
  name: 'appServiceModule'
  params: {
    location: location
    name: '${projectPrefix}-web'
    appServicePlanId: appServicePlan.outputs.planId
    appInsightsInstrumentationKey: appInsights.outputs.instrumentationKey
  }
}

module managedIdentity 'Infra/Managedidentity.bicep' = {
  name: 'managedIdentityModule'
  params: {
    location: location
    name: '${projectPrefix}-identity'
  }
}

module grafana 'Infra/Grafana.bicep' = {
  name: 'grafanaModule'
  params: {
    location: location
    name: '${projectPrefix}-grafana'
  }
}
