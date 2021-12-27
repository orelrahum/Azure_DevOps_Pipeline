#code PS1 to make new Storage
$Storage_name=$args[0]
$Parameters_name=$args[1]
$ResourceGroup="orelrahumubuntu_group"


New-AzResourceGroupDeployment -Name $Storage_name -ResourceGroupName $ResourceGroup `
  -TemplateFile Storage_Codes\Storage_Template.json `
  -TemplateParameterFile Storage_Codes\$Parameters_name


$containerName = "quickstartblobs3"
$storageAcc=Get-AzStorageAccount -ResourceGroupName $ResourceGroup -Name $Storage_name
$ctx = $storageAcc.Context
try 
{
    new-AzStoragecontainer -Name $containerName -Context $ctx -Permission Container -ErrorAction Stop
    Write-Host "container on server 1 compleated"
}
catch 
{
    Write-Host "container on server 1 Already Exists"
}