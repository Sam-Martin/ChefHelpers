Function Get-CHEncryptedDatabag{
    param(
        $knifeRb = ".\knife.rb",
        [parameter(Mandatory)]
        $SecretFile, 
        [parameter(Mandatory)]
        $DatabagName, 
        [parameter(Mandatory)]
        $DatabagItemName
    )
    knife data bag show "$DatabagName" "$DatabagItemName" -c $knifeRB --secret-file $SecretFile -F json
    $DatabagItem  -replace '^\w*[^"{}\[\]]+' | Convertfrom-Json
}
