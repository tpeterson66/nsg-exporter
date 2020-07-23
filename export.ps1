# Get the NSGs from Azure CLI
$export = @()
$nsgs = az network nsg list | ConvertFrom-JSON

Add-Content -Path ./nsg-export.csv  -Value 'NSG Name,Resource Group,Direction,Description,Priority'

Foreach($nsg in $nsgs) {
    Foreach($rule in $nsg.securityRules){
        Add-Content -Path ./nsg-export.csv  -Value "$($nsg.name),$($nsg.resourceGroup),$($rule.direction),$($rule.description),$($rule.priority)"
    }
}
