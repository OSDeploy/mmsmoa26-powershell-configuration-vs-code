@{
    IncludeDefaultRules = $true
    IncludeRules = @(
        'PSAvoidShortVariableNames'
    )
    CustomRulePath = @(
        '.\PSScriptAnalyzer\AnalyzerRules\MyDemoModule.CustomRules.psm1'
    )
    Severity = @('Error','Warning','Information')
    ExcludeRules = @(
        'PSUseShouldProcessForStateChangingFunctions'
    )
    Rules = @{
        PSAvoidShortVariableNames = @{
            Enable        = $true
            MinimumLength = 4
        }
        PSPlaceOpenBrace = @{
            Enable             = $true
            OnSameLine         = $true
            NewLineAfter       = $true
            IgnoreOneLineBlock = $true
        }
        PSPlaceCloseBrace = @{
            Enable             = $true
            NewLineAfter       = $true
            IgnoreOneLineBlock = $true
        }
        PSUseConsistentIndentation = @{
            Enable          = $true
            IndentationSize = 4
            Kind            = 'space'
        }
        PSUseConsistentWhitespace = @{
            Enable         = $true
            CheckOpenBrace = $true
            CheckOpenParen = $true
            CheckOperator  = $true
            CheckSeparator = $true
        }
    }
}
