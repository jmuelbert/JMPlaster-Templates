function Get-JMuTemplate {
    <#
    .SYNOPSIS
        Returns JMu's Plaster template
    .DESCRIPTION
        Returns JMu's Plaster template
    .EXAMPLE
        $template = Get-JMuTemplate
        $template | New-JMuModule

        Gets the Plaster template from the JMu module and creates a new module with it
    .LINK
        New-JMuModule
    #>
    [OutputType([PSCustomObject])]
    [cmdletbinding()]
    param()

    $moduleBase = $ExecutionContext.SessionState.Module.ModuleBase
    Get-PlasterTemplate -Path $moduleBase
}
