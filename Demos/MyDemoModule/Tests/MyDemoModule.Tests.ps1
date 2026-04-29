BeforeAll {
    $ModulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\MyDemoModule.psd1'
    Import-Module -Name $ModulePath -Force
}

Describe 'Get-DemoVersion' {
    It 'Returns a System.Version' {
        $Result = Get-DemoVersion
        $Result | Should -BeOfType [System.Version]
    }

    It 'Matches the manifest ModuleVersion' {
        $ManifestPath = Join-Path -Path $PSScriptRoot -ChildPath '..\MyDemoModule.psd1'
        $Manifest = Import-PowerShellDataFile -Path $ManifestPath
        (Get-DemoVersion).ToString() | Should -Be $Manifest.ModuleVersion
    }
}

Describe 'Get-DemoStatus' {
    BeforeAll {
        Mock -CommandName Test-Connection -ModuleName MyDemoModule -MockWith { $true }
    }

    It 'Returns one object per input computer' {
        $Result = Get-DemoStatus -ComputerName 'a','b','c'
        $Result.Count | Should -Be 3
    }

    It 'Sets Online based on Test-Connection result' {
        $Result = Get-DemoStatus -ComputerName 'a'
        $Result.Online | Should -BeTrue
    }

    It 'Accepts pipeline input by value' {
        $Result = 'a','b' | Get-DemoStatus
        $Result.Count | Should -Be 2
    }
}
