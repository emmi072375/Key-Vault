targetScope = 'subscription'
param myResourceGroup string = 'rg-zellytest007'






@description('Specifies the name of the key vault.')
param keyVaultName string = 'myKeyEmran301'

@description('Specifies the Azure location where the key vault should be created.')
param location string = 'swedencentral'

@description('Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault.')
param enabledForDeployment bool = false

@description('Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys.')
param enabledForDiskEncryption bool = false

@description('Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault.')
param enabledForTemplateDeployment bool = false

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param tenantId string = '9c046eef-c638-480d-88b5-8bc72045ae37'

@description('Specifies the object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Get it by using Get-AzADUser or Get-AzADServicePrincipal cmdlets.')
param objectId string = 'f9e7bc6f-3486-408e-8c6d-361eac7f7803'

@description('Specifies the permissions to keys in the vault. Valid values are: all, encrypt, decrypt, wrapKey, unwrapKey, sign, verify, get, list, create, update, import, delete, backup, restore, recover, and purge.')
param keysPermissions array = [
  'list'
]

@description('Specifies the permissions to secrets in the vault. Valid values are: all, get, list, set, delete, backup, restore, recover, and purge.')
param secretsPermissions array = [
  'list'
]

@description('Specifies whether the key vault is a standard vault or a premium vault.')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

@description('Specifies the name of the secret that you want to create.')
param secretName string = 'emransecert007'

@description('Specifies the value of the secret that you want to create.')

param secretValue string = '008877'



//Create Resource Group 

resource myRG01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: location

}

module myKeyvault007 'keyvault.bicep' = {
  name: 'myKeyVaultDeploy'
  scope: myRG01
  params: {
    location: location
    keyVaultName: keyVaultName
    keysPermissions: keysPermissions
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    tenantId: tenantId
    objectId: objectId
    skuName: skuName
    secretName: secretName
    secretValue: secretValue
    secretsPermissions: secretsPermissions
  }
}

