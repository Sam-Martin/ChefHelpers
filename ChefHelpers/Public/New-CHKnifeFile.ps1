Function Create-KnifeFile{
    param(
        [Parameter(Mandatory)]
        $OrganisationName,
        [Parameter(Mandatory)]
        $Username,
        [Parameter(Mandatory)]
        $Cookbookpath = "#{current_dir}/cookbooks",
        [Parameter(Mandatory)]
        $ChefServerUri = "https://api.chef.io",
        [Parameter(Mandatory)]
        $KnifeFileName = 'knife.rb'
    )


    Write-Verbose "Writing knife file to $KnifeFileName"
    @"
# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "$Username"
client_key               "#{current_dir}/$ClientKey"
chef_server_url          "$ChefServerUri/organizations/$OrganisationName"
cookbook_path            ["$($Cookbookpath -join '","')"]
"@ | Set-Content $KnifeFileName

}