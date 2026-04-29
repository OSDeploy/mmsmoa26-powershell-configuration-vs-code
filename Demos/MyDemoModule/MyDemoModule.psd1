@{
    RootModule        = 'MyDemoModule.psm1'
    ModuleVersion     = '0.1.0'
    GUID              = 'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d'
    Author            = 'David Segura, Jeff Scripter'
    CompanyName       = 'Recast Software'
    Copyright         = '(c) 2026 Recast Software. All rights reserved.'
    Description       = 'Demo module for the MMSMOA 2026 session: Master PowerShell Configuration in VS Code.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DemoStatus','Get-DemoVersion')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData = @{
        PSData = @{
            Tags         = @('Demo','MMSMOA','VSCode')
            ProjectUri   = 'https://github.com/'
            ReleaseNotes = 'Initial demo release.'
        }
    }
}
