

Remove-Item -Path "$PSScriptRoot\..\bin" -Force
dotnet build ".\.github\Setup.csproj" --configuration Release --force 

$ExicutionPath = Resolve-Path -Path "$PSScriptRoot\..\bin\Release\*\Powrshell"

Import-Module "$ExicutionPath\Setup\SetupGitHooks.psm1"

SetupGitHooks