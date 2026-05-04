function PSAvoidShortVariableNames {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [System.Management.Automation.Language.ScriptBlockAst]$ScriptBlockAst,

        [ValidateRange(1, 256)]
        [int]$MinimumLength = 4
    )

    $automaticVariableNames = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    @(
        '_',
        'PSItem',
        'args',
        'this',
        'input',
        'foreach',
        'switch',
        'matches',
        'true',
        'false',
        'null'
    ) | ForEach-Object {
        [void]$automaticVariableNames.Add($_)
    }

    $seenNames = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $diagnostics = [System.Collections.Generic.List[Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord]]::new()

    $variableAsts = $ScriptBlockAst.FindAll(
        {
            param($Ast)
            $Ast -is [System.Management.Automation.Language.VariableExpressionAst]
        },
        $true
    )

    foreach ($variableAst in $variableAsts) {
        $name = $variableAst.VariablePath.UserPath

        if ([string]::IsNullOrWhiteSpace($name)) {
            continue
        }

        if ($name.Contains(':')) {
            continue
        }

        if ($automaticVariableNames.Contains($name)) {
            continue
        }

        if ($name.Length -ge $MinimumLength) {
            continue
        }

        if (-not $seenNames.Add($name)) {
            continue
        }

        $diagnostics.Add(
            [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord]::new(
                "Variable '$name' is shorter than $MinimumLength characters. Use a more descriptive variable name.",
                $variableAst.Extent,
                'PSAvoidShortVariableNames',
                [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticSeverity]::Warning,
                $null,
                $null
            )
        )
    }

    return $diagnostics
}

Export-ModuleMember -Function PSAvoidShortVariableNames
