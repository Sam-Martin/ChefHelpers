Function New-CHKnifeFile{
    param(
        [Parameter(Mandatory)]
        [string]$OrganisationName,
        [Parameter(Mandatory)]
        [string]$Username,
        [string[]]$Cookbookpath = "#{current_dir}/cookbooks",
        [string]$ChefServerUri = "https://api.chef.io",
        [string]$KnifeFileName = 'knife.rb'
    )

    if(!$ClientKey){
        $ClientKey = "#{current_dir}/$username.pem"
    }

    Write-Verbose "Writing knife file to $KnifeFileName"
    @"
# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "$Username"
client_key               "$ClientKey"
chef_server_url          "$ChefServerUri/organizations/$OrganisationName"
cookbook_path            ["$($Cookbookpath -join '","')"]
"@ | Set-Content $KnifeFileName

}