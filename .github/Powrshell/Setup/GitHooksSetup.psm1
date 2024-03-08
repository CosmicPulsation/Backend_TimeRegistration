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
		AddGitHook -GitHook $gitHook -DotGitPath $dotGitPath
	}

	Write-Host "End Setup Git Hooks"
}

function GetGitHools
{
	return Get-ChildItem -Path "$PSScriptRoot\..\GitHooks\" -Filter "*.ps1" | Select-Object -ExpandProperty Name
}

function AddGitHook
{
	# Parameter help description
	param(
    [Parameter(Mandatory=$true)]
    [string]$GitHook,
	[Parameter(Mandatory=$true)]
	[string]$DotGitPath
	)

	
}