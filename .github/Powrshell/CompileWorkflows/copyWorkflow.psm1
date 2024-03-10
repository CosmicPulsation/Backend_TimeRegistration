function CompileWorkfolw
{
	$path = Resolve-Path -Path "$PSScriptRoot\..\..\Pipline" | Select-Object -ExpandProperty Path
	$pastPath = ".\.github\workflows"
	
	$workflows = Get-ChildItem -Path $path -Filter "*.yaml" –depth 10 | Select-Object -ExpandProperty Fullname

	foreach ($workflow in  $workflows )
	{
		$relativePath = $workflow.Replace("$path\", "")
		$relativePath = $relativePath -replace "\\", "."
		Write-Host "Copy documents:`r`n $workflow -> $pastPath\$relativePath"
		Copy-Item -Path $workflow -Destination "$pastPath\$relativePath"
	}
	git add "$pastPath\*"
}