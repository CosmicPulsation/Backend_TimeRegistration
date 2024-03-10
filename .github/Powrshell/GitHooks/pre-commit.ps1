
Write-Host "Script was run"
dotnet build ".\.github\Setup.csproj" --configuration Release --no-incremental --force

$ExicutionPath = Resolve-Path -Path "$PSScriptRoot\..\CompileWorkflows\copyWorkflow.psm1"

Import-Module $ExicutionPath -force
CompileWorkfolw

Start-Sleep 20
Write-Host "Script complidet"
