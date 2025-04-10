// main.bicep

param location string = resourceGroup().location
param projectPrefix string = 'verifiedid'

module logAnalytics 'infra/Loganalyticworkspace.bicep' = {
  name: 'logAnalyticsModule'
  params: {
    location: location
    name: '${projectPrefix}-law'
  }
}

module appInsights 'infra/applicationinsights.bicep' = {
  name: 'appInsightsModule'
  params: {
    location: location
    name: '${projectPrefix}-ai'
    workspaceId: logAnalytics.outputs.workspaceId
  }
}

module keyVault 'infra/keyvault.bicep' = {
  name: 'keyVaultModule'
  params: {
    location: location
    name: '${projectPrefix}-kv'
  }
}

module storageAccount 'infra/storageaccount.bicep' = {
  name: 'storageAccountModule'
  params: {
    location: location
    name: '${projectPrefix}storage'
  }
}

module blobService 'infra/blobservice.bicep' = {
  name: 'blobServiceModule'
  params: {
    storageAccountName: storageAccount.outputs.storageAccountName
  }
}

module staticWebsite 'infra/Staticwebsite.bicep' = {
  name: 'staticWebsiteModule'
  params: {
    storageAccountName: storageAccount.outputs.storageAccountName
  }
}

module appServicePlan 'infra/appserviceplan.bicep' = {
  name: 'appServicePlanModule'
  params: {
    location: location
    name: '${projectPrefix}-plan'
  }
}

module appService 'infra/appservice.bicep' = {
  name: 'appServiceModule'
  params: {
    location: location
    name: '${projectPrefix}-web'
    appServicePlanId: appServicePlan.outputs.planId
    appInsightsInstrumentationKey: appInsights.outputs.instrumentationKey
  }
}

module managedIdentity 'infra/Managedidentity.bicep' = {
  name: 'managedIdentityModule'
  params: {
    location: location
    name: '${projectPrefix}-identity'
  }
}

module grafana 'infra/Grafana.bicep' = {
  name: 'grafanaModule'
  params: {
    location: location
    name: '${projectPrefix}-grafana'
  }
}
