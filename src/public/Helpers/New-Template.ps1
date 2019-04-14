<#
.SYNOPSIS
    Generate a plaster Manifest

.DESCRIPTION
    Generate a full plaster Manifest with
    a Template-Name and a Author-Name.

.NOTES
    File Name       : 'New-Template.ps1'
    Author          : Jürgen Mülbert (juergen.muelbert@gmail.com)'
    Prerequisite    : PowerShell V5 or newer. Plaster V1.1.3
    Copyright 2019 - Jürgen Mülbert

.LINK
    https://github.com/jmuelbert/JMPlasterModule

.EXAMPLE
    New-Template -templateName MyTemplate -authorName 'Author'

#>
param(
    [String]$templateName = 'PlasterTemplate',
    [String]$authorName = 'Jürgen Mülbert')

$manifestProperties = @{
    Path         = ".\$templateName\PlasterManifest.xml"
    Title        = 'Generate Plaster Manifest'
    TemplateName = $templateName
    TemplateType = 'Project'
    Author       = $authorName
    Description  = 'Scaffolds the files required for a PowerShell script module'
    Tags         = 'PowerShell, Module, ModuleManifest'
}
$Folder = Split-Path -Path $manifestProperties.Path -Parent

if (-not(Test-Path -Path $Folder -PathType Container)) {
    New-Item -Path $Folder -ItemType Directory | Out-Null
}
New-PlasterManifest @manifestProperties