function Get-DemoStatus {
    <#
    .SYNOPSIS
        Returns a small status object for one or more computers.

    .DESCRIPTION
        Pings each computer with Test-Connection and returns a [pscustomobject]
        per input with Computer, Online, and Timestamp properties.

    .PARAMETER ComputerName
        One or more computer names. Accepts pipeline input.

    .EXAMPLE
        Get-DemoStatus -ComputerName $env:COMPUTERNAME

    .EXAMPLE
        'host1','host2' | Get-DemoStatus

    .OUTPUTS
        System.Management.Automation.PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([pscustomobject])]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]]$ComputerName
    )

    process {
        foreach ($Name in $ComputerName) {
            $Online = $false
            try {
                $Online = Test-Connection -TargetName $Name -Count 1 -Quiet -ErrorAction Stop
            }
            catch {
                Write-Verbose "Test-Connection failed for $Name : $_"
            }

            ConvertTo-DemoObject -Computer $Name -Online $Online
        }
    }
}
