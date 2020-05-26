# Provision storage and function app
.\Deploy-AzureResourceGroup.ps1 `
    -ResourceGroupLocation EastUS `
    -ResourceGroupName TeamsProvisioningDev `
    -TemplateParametersFile dev.parameters.json

# Ensure storage queues are in place
$storageAccount = Get-AzStorageAccount | Where-Object ResourceGroupName -eq "TeamsProvisioningDev"
$storageContext = $storageAccount.Context
New-AzStorageQueue -Name "create-team-request-queue" -Context $storageContext -ErrorAction Ignore
New-AzStorageQueue -Name "create-team-completion-queue" -Context $storageContext -ErrorAction Ignore
New-AzStorageQueue -Name "clone-team-request-queue" -Context $storageContext -ErrorAction Ignore
New-AzStorageQueue -Name "clone-team-completion-queue" -Context $storageContext -ErrorAction Ignore




