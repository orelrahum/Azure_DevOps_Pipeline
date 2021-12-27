#code PS1 to make new Ubuntu Server
try 
{
    New-AzResourceGroupDeployment -Name orelrahumserverubuntu -ResourceGroupName orelrahumubuntu_group `
    -TemplateFile Server_Codes\Server_Template.json `
    -TemplateParameterFile Server_Codes\Server_Parameters.json -ErrorAction Stop
}
catch 
{
    Write-Host "Server1 Already Exists"
}