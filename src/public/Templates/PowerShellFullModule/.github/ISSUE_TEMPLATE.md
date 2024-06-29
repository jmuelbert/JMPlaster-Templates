<!--
Check the FAQ https://github.com/<%= $PLASTER_PARAM_GitHubUserName %>/<%= $PLASTER_PARAM_GitHubRepo %>/wiki/FAQ to see if your issue is addressed there.
If not, PLEASE fill in the following details so that we can help you!
-->

### System Details

-<%= \$PLASTER_PARAM_GitHubRepo %> version/path:

- PowerShell version:
- Git version:
- Operating system name and version:

<!--
To retrieve the system details, paste the following line into PowerShell, press Enter
and then copy/paste the resulting output above.

"- <%= $PLASTER_PARAM_ModuleName %> version/path: $($m = Get-Module <%= $PLASTER_PARAM_ModuleName %>; '{0} {1} {2}' -f $m.Version,$m.PrivateData.PSData.Prerelease,$m.ModuleBase.Replace($HOME,'~'))`n- PowerShell version: $($PSVersionTable.PSVersion)`n- $(
git --version)`n- OS: $([System.Environment]::OSVersion)"
-->

### Issue Description

I am experiencing a problem with...
