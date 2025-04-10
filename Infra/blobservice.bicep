param storageAccountName string

@description('Generated from /subscriptions/6c516f03-07d2-44c8-8ab5-15d92d64f2f5/resourceGroups/PoC/providers/Microsoft.Storage/storageAccounts/idunnocorpstorage2/blobServices/default')
resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2024-01-01' = {
  name: '${storageAccountName}/default'
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

output blobServiceName string = blobService.name
