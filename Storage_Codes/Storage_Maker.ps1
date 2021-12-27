#code PS1 to make new Storage
$Storage_name=$args[0]
$Parameters_name=$args[1]

New-AzResourceGroupDeployment -Name $Storage_name -ResourceGroupName orelrahumubuntu_group `
  -TemplateFile Storage_Codes\Storage_Template.json `
  -TemplateParameterFile Storage_Codes\$Parameters_name