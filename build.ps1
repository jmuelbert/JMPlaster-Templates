[cmdletbinding()]
param ($Task = 'Default')

Write-Output "Starting Build"

if (-not (Get-PackageProvider | Where-Object Name -EQ nuget)) {
    Write-Output "  Install Nuget PS package provider"
    Install-PackageProvider -Name NuGet -Force -Confirm:$false | Out-Null
}


$publishRepository = 'PSGallery'

# Grab nuget bits, install modules, set build variables, start build.
Write-Output "  Install And Import Build Modules"

$psDependVersion = '0.3.0'
if (-not(Get-InstalledModule -Name PSDepend -RequiredVersion $psDependVersion -EA SilentlyContinue)) {
    Install-Module PSDepend -RequiredVersion $psDependVersion -Force -Scope CurrentUser
}

Import-Module -Name PSDepend -RequiredVersion $psDependVersion
Invoke-PSDepend -Path "$PSScriptRoot\build.depend.psd1" -Install -Import -Force

if (-not (Get-Item env:\BH*)) {
    Set-BuildEnvironment
    Set-Item env:\PublishRepository -Value $publishRepository
}
. "$PSScriptRoot\tests\Unload-SUT.ps1"

Write-Output "  InvokeBuild"
Invoke-Build $Task -Result result
if ($Result.Error) {
    exit 1
}
else {
    exit 0
}

#endregion Dependency checks

$currentPath = Split-Path $MyInvocation.MyCommand.Path -Parent
$outputPath = Join-Path -Path $currentPath -ChildPath "bin"

if ($null -eq (Get-Command New-ExternalHelp -ErrorAction SilentlyContinue)) {
    throw "Please install PlatyPS using: Install-Module PlatyPS -Scope currentuser"
}

if ($Clean) {
    Write-Verbose "Cleaning $outputPath" -Verbose
    try {
        Remove-Item -Path $outputPath -Recurse -Force -ErrorAction Stop
    }
    catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning "$outputPath does not exist.  Skipping clean."
    }
}

if (-not (Test-Path -PathType Container $outputPath)) {
    New-Item -ItemType Directory -Path $outputPath
}


Write-Verbose "Converting help" -Verbose
New-ExternalHelp -OutputPath $outputPath -Path .\docs\Module\ -Force

Write-Verbose "Module saved to: $outputPath" -Verbose
