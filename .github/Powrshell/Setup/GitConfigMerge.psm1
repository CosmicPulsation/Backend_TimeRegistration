function ConfigureGitMerge
{
	git config merge.ours.driver true
	
	$attributesContent = 
@'
**/.github/workflows/*.yaml merge=ours
'@
	Set-Content -parh ".\.git\info\attributes" -Value $attributesContent -Force
	Write-Host "Finsh setup merge config" -ForegroundColor Cyan
}