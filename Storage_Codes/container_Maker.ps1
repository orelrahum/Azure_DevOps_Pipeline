#code PS1 to make new container
$Storage_name=$args[0]
$containerName = "quickstartblobs3"
$ResourceGroup="orelrahumubuntu_group"
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