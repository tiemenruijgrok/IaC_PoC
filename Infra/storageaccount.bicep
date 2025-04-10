@description('Naam van het Storage Account')
param name string

@description('Locatie van het Storage Account')
param location string

@description('Generated from /subscriptions/6c516f03-07d2-44c8-8ab5-15d92d64f2f5/resourceGroups/PoC/providers/Microsoft.Storage/storageAccounts/idunnocorpstorage2')
resource storageAccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  name: name
  location: location
  tags: {}
  properties: {
    accessTier: 'Hot'
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    supportsHttpsTrafficOnly: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    encryption: {
      requireInfrastructureEncryption: false
      keySource: 'Microsoft.Storage'
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
    }
  }
}

output storageAccountName string = storageAccount.name
output storageAccountId string = storageAccount.id
