@{
    IncludeDefaultRules = $true
    Severity = @('Error','Warning','Information')
    ExcludeRules = @(
        'PSUseShouldProcessForStateChangingFunctions'
    )
    Rules = @{
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
