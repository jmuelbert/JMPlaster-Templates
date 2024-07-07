describe 'Get-JMuTemplate' {
    it 'Returns the JMu template' {
        $t = Get-JMuTemplate
        $t.psobject.TypeNames.Contains('System.Management.Automation.PSCustomObject') | Should -Be $true
    }
}
