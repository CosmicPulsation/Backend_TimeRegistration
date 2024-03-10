
dotnet build ".\.github\Setup.csproj" --configuration Release --no-incremental --force

$ExicutionPath = Resolve-Path -Path "$PSScriptRoot\..\CompileWorkflows\copyWorkflow.psm1"

Import-Module $ExicutionPath -force
CompileWorkfolw
Write-Host "Script was run"

Start-Sleep 20
