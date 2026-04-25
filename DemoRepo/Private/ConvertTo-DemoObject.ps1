function ConvertTo-DemoObject {
    <#
    .SYNOPSIS
        Internal helper. Builds the standard demo status object.
    #>
    [CmdletBinding()]
    [OutputType([pscustomobject])]
    param(
        [Parameter(Mandatory)]
        [string]$Computer,

        [Parameter(Mandatory)]
        [bool]$Online
    )

    [pscustomobject]@{
        Computer  = $Computer
        Online    = $Online
        Timestamp = [datetime]::UtcNow
    }
}
