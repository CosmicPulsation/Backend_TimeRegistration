function CompileWorkfolw
{
	$path = Resolve-Path -Path "$PSScriptRoot\..\..\Pipline" | Select-Object -ExpandProperty Path
	$pastPath = ".\.github\workflows"
	
	$workflows = Get-ChildItem -Path $path -Filter "*.yaml" –depth 10 | Select-Object -ExpandProperty Fullname
	
	Write-Host "Clear: $pastPath" -ForegroundColor Cyan
	Remove-Item -Path "$pastPath\*"

	foreach ($workflow in  $workflows )
	{
		$relativePath = $workflow.Replace("$path\", "")
		$relativePath = $relativePath -replace "\\", "."
		Write-Host "Copy documents:`r`n $workflow -> $pastPath\$relativePath" -ForegroundColor Cyan
		Copy-Item -Path $workflow -Destination "$pastPath\$relativePath"
	}
	git add "$pastPath\*"
}