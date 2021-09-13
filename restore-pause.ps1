Install-Module -Name Az.Synapse -force
$workspacename = "workspace-name"
$sqlpoolname = "sql-pool-name"
$pool = Get-AzSynapseSqlPool -WorkspaceName $workspacename -Name $sqlpoolname
$databaseId = $pool.Id -replace "Microsoft.Synapse", "Microsoft.Sql" `
-replace "workspaces", "servers" `
-replace "sqlPools", "databases"
$restorePoint = $pool | Get-AzSynapseSqlPoolRestorePoint | Select -Last 1
$restoredpoolname = $pool.SqlPoolName+ (Get-Date -Date $restorePoint.RestorePointCreationDate -Format MMyy)
$restoredPool = Restore-AzSynapseSqlPool -FromRestorePoint -RestorePoint $restorePoint.RestorePointCreationDate -TargetSqlPoolName $restoredpoolname -WorkspaceName $pool.WorkspaceName -ResourceId $databaseId -PerformanceLevel DW100c
$restoredPool | Suspend-AzSynapseSqlPool