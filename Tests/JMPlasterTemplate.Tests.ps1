
#Requires -Modules PSScriptAnalyzer, Pester

$script:moduleRoot = Split-Path $PSScriptRoot -Parent
$script:moduleName = Split-Path $moduleRoot -Leaf

Describe 'Script Analyzer Check' {
    Context -Name 'There should be no errors or warnings from Script Analyzer' {
        $Results = Invoke-ScriptAnalyzer -Path $moduleRoot -Recurse

        if($Results){
            throw 'PSScriptanalyzer detected violations. Use "Invoke-Scriptanalyzer" to get properly formatted output.'
        }
    }
}
