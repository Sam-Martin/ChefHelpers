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
    $databagItemJson = knife data bag show "$DatabagName" "$DatabagItemName" -c $knifeRB --secret-file $SecretFile -F json
    return $databagItemJson  -replace '^\w*[^"{}\[\]]+' | Convertfrom-Json
}
