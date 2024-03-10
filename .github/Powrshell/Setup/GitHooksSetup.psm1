function SetupGitHooks
{
	Write-Host "Start Setup Git Hooks"
	$GitHooks = GetGitHools
	$dotGitPath = $PSScriptRoot
	$foldercount = ([regex]::Matches($PSScriptRoot, "\\" )).count
	Write-Host "Folder depth: $foldercount"
	$dotGitPath += "\..\"
	Write-Host "Initila .git path: $dotGitPath"

	for ($i = 1; $i -lt $foldercount; $i++)
	{
		if(Test-Path -Path "$dotGitPath.git")
		{
			break;
		}
		$dotGitPath += "..\"
	}

	$dotGitPath += ".git"
	Write-Host ".Git Path: $dotGitPath"

	foreach ($gitHook in $GitHooks)
	{
		AddGitHook -GitHook $gitHook -DotGitPath $dotGitPath -ScriptPath "$PSScriptRoot\..\GitHooks"
	}
    # Allow execution
    Write-Output "Setting execution policy on git hook post-merge file" -ForegroundColor Cyan
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

	Write-Host "End Setup Git Hooks"
}

function GetGitHools
{
	$Hooks = Get-ChildItem -Path "$PSScriptRoot\..\GitHooks\" -Filter "*.ps1" | Select-Object -ExpandProperty Name
	$Hooks = $Hooks -replace ".ps1", ""
	return $Hooks
}

function AddGitHook
{
	# Parameter help description
	param(
    [Parameter(Mandatory=$true)]
    [string]$GitHook,
	[Parameter(Mandatory=$true)]
	[string]$DotGitPath,
	[Parameter(Mandatory=$true)]
	[string]$ScriptPath
	)
	$GitHookPath = $DotGitPath + "\hooks\" + $GitHook
	Write-Output $GitHookPath

	$ScriptLocation = "$ScriptPath\Test.ps1" -replace "\\", "\\\\"
	$fileContent = "#!/bin/sh`r`n"
    $fileContent += "C:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -Command ""start powershell '$ScriptPath\$GitHook.ps1' -Wait"""
	Set-Content $GitHookPath $fileContent -Force
}