@description('Naam van de User Assigned Managed Identity')
param name string

@description('Locatie van de identity')
param location string

@description('Generated from /subscriptions/6c516f03-07d2-44c8-8ab5-15d92d64f2f5/resourceGroups/PoC/providers/Microsoft.ManagedIdentity/userAssignedIdentities/sample-webapp-id-id-bd91')
resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30' = {
  location: location
  tags: {}
  name: name
}

output identityId string = managedIdentity.id
