# JMPlasterTemplate

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)

Templates for Plaster

- [JMPlasterTemplate](#jmplastertemplate)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Module Structure](#module-structure)
  - [Usage](#usage)
    - [Azure DevOps](#azure-devops)
    - [Locally](#locally)
  - [Contributing](#contributing)

## Installation

To use these task you need to make sure your code follows a few guidelines.

### Prerequisites

- [PSDepend][psdepend]
- [Pester][pester]
- [InvokeBuild][invokebuild]
- [BuildQualityChecks (Azure DevOps Task)][buildqschecks]
- [GitVersion (Azure DevOps Task)][devops_gitversion]
- [BuildHelpers][buildhelpers]
- [GitVersion][gitversion] (Optional)
- [PowerShell Core][powershell_core] (For building locally)

### Module Structure

```powershell
+── src
│   +── classes  (Optional)
│   │   +── *.psm1
│   +── private (Optional)
│   │   +── *.ps1
│   +── public (Optional)
│   │   +── *.ps1
+── tests (Optional)
+── Manifest.json
+── azure-pipelines.yml
+── GitVersion.yml (Optional)
+── .build.ps1
+── PSDepend.build.psd1
```

Check the template files contained in this repository for help.

## Usage

### Azure DevOps

After configuring according to [Installation](#installation) run your Azure Pipelines build process.

### Locally

To build locally you will require PowerShell Core. This has no impact on the actual usage of the module or the tests, but it required for things such as semanticversioning class, New-ModuleManifest improvements etc.

```bash
Invoke-Build -Tasks CreateModuleManifest, DownloadDependentModules -ResolveDependency
```

Once the module is built, you can run the tests in either PowerShell Core or WinPS as necessary.

```bash
Invoke-Build -Tasks Test
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

[psdepend]: https://github.com/RamblingCookieMonster/PSDepend
[pester]: https://github.com/pester/Pester
[invokebuild]: https://github.com/nightroman/Invoke-Build
[buildqschecks]: https://marketplace.visualstudio.com/items?itemName=mspremier.BuildQualityChecks
[devops_gitversion]: https://marketplace.visualstudio.com/items?itemName=gittools.gitversion
[buildhelpers]: https://github.com/RamblingCookieMonster/BuildHelpers
[gitversion]: https://github.com/GitTools/GitVersion
[powershell_core]: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4&viewFallbackFrom=powershell-6
