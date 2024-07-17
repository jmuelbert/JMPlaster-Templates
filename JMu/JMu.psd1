@{
    RootModule        = 'JMu.psm1'
    ModuleVersion     = '0.0.1'
    GUID              = '24effa48-ac05-4efd-872d-40d556089ce0'
    Author            = 'Jürgen Mülbert'
    CompanyName       = ''
    Copyright         = '(c) Jürgen Mülbert. All rights reserved.'
    Description       = 'An opinionated Plaster template for high-quality PowerShell modules'
    PowerShellVersion = '3.0'
    RequiredModules   = @(
        @{ModuleName = 'BuildHelpers'; ModuleVersion = '2.0.16' }
        @{ModuleName = 'Plaster'; ModuleVersion = '1.1.4' }
        @{ModuleName = 'psake'; ModuleVersion = '4.9.0' }
        @{ModuleName = 'PowerShellBuild'; ModuleVersion = '0.6.1' }
    )
    FunctionsToExport = @(
        'Get-JMuTemplate'
        'New-JMuModule'
    )
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Extensions   = @(
                @{
                    Module         = 'Plaster'
                    MinimumVersion = '1.1.3'
                    Details        = @{
                        TemplatePaths = @('.')
                    }
                }
            )
            Tags         = @('Plaster', 'Module', 'Template', 'PSEdition_Core', 'PSEdition_Desktop')
            LicenseUri   = 'https://raw.githubusercontent.com/jmuelbert/JMPlaster-Templates/main/LICENSE'
            ProjectUri   = 'https://github.com/jmuelbert/JMPlaster-Templates'
            IconUri      = 'https://raw.githubusercontent.com/jmuelbert/JMPlaster-Templates/main/media/trowel.png'
            ReleaseNotes = 'https://raw.githubusercontent.com/jmuelbert/JMPlaster-Templates/main/CHANGELOG.md'
        }
    }
}
