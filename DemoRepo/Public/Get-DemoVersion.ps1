function Get-DemoVersion {
    <#
    .SYNOPSIS
        Returns the MyDemoModule version.

    .DESCRIPTION
        Reads the module manifest next to this file and returns the ModuleVersion
        as a [System.Version].

    .EXAMPLE
        Get-DemoVersion

    .OUTPUTS
        System.Version
    #>
    [CmdletBinding()]
    [OutputType([System.Version])]
    param()

    $ManifestPath = Join-Path -Path $PSScriptRoot -ChildPath '..\MyDemoModule.psd1'
    $Manifest = Import-PowerShellDataFile -Path $ManifestPath
    [System.Version]$Manifest.ModuleVersion
}
