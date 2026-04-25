# MyDemoModule loader. Dot-source Private then Public, then export Public.

$Private = @( Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" -ErrorAction SilentlyContinue )
$Public  = @( Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1"  -ErrorAction SilentlyContinue )

foreach ($File in @($Private + $Public)) {
    try {
        . $File.FullName
    }
    catch {
        Write-Error -Message "Failed to import $($File.FullName): $_"
    }
}

Export-ModuleMember -Function $Public.BaseName
