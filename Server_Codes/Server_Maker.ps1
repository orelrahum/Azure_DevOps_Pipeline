#code PS1 to make new Ubuntu Server

New-AzResourceGroupDeployment -Name orelrahumserverubuntu -ResourceGroupName orelrahumubuntu_group `
-TemplateFile Server_Codes\Server_Template.json `
-TemplateParameterFile Server_Codes\Server_Parameters.json
