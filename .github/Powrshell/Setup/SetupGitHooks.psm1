function SetupGitHooks
{
	Write-Host "Start Setup Git Hooks"
}

function GetGitHools
{
	Get-ChildItem -Path "$PSScriptRoot\..\GitHooks\" -Filter "*.ps1"
}