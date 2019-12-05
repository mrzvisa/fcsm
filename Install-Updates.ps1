$RootHotfixPath = 'C:\temp\' #Updates directory
 
$Hotfixes = @(
        'windows8.1-kb3025091-v5-x64_7c1de48183a211af6a372aef5773584cb8131387.msu',
        'windows8.1-kb3044457-x64_fdbf79f2a42906a09bc79520cfca64f859e883a1.msu',
        'windows8.1-kb3049443-x64_98e751d36397bc878b0c3480d5df5cfd4cb7beea.msu',
        'windows8.1-kb3068444-x64_c2fe12750ed157347c51c5181294b8ba00411d1c.msu',
        'Windows8.1-KB3118401-x64.msu'

)
#$Servers = Get-Content 'C:\temp\MachineList.txt'
$servers = 'svm101' #Hosts

foreach ($Server in $Servers)
{
    Write-Host "Processing $Server..."

    $needsReboot = $False
    $remotePath = "\\$Server\c$\sys"
    $remotePathUpdates = $remotePath +"\updates"
    $remotepath2 = "C:\sys\updates"

    if(Test-Connection $Server -Count 1 -Quiet) 
    {
        #Write-Warning "$Server is not accessible"
        Write-Host "$Server is accessible" -ForegroundColor Green
        #continue
    }

    if ( -not (Test-Path $remotePath))
    {
        Write-Host "Folder $remotePath does not exist on the target server" -WarningAction
        New-Item -Path $remotePath -ItemType Directory -Force
    }
        Else
            {
                Write-Host "$remotepath is exist" -ForegroundColor Green
            }

    foreach ($Hotfix in $Hotfixes)
    {
        Write-Host "hotfix: $Hotfix"
        $HotfixPath = "$RootHotfixPath$Hotfix"
        $RemoteHotfixPathMSU = "$RemotePath2\$Hotfix"
        #$RemoteHotfixPathCAB = $RemoteHotfixPathMSU.Replace(".msu",".cab") #Rename file
        $RemoteHotfixPathMSUShort = $RemoteHotfixPathMSU.Split('_') 
        $RemoteHotfixPathMSUShort = $RemoteHotfixPathMSUShort[0]
        $RemoteHotfixPathCAB = $RemoteHotfixPathMSUShort + '.cab'
        if (-not (Test-Path $remotePathUpdates))
            {
                New-item -Path $remotePath -Name 'Updates' -ItemType "directory" #Create Update Directory
            }
        Copy-Item $Hotfixpath $remotePathUpdates
        Write-Host "File was copied" -ForegroundColor green
        Invoke-Command -ComputerName $servers -ScriptBlock {expand “$using:RemoteHotfixPathMSU” . -F:* $using:remotePath2}
        Write-Host "Cab was exported" -ForegroundColor green
        
        $SB = {(Start-Process -FilePath 'dism.exe' -ArgumentList "/online /add-package /PackagePath:$using:RemoteHotfixPathCAB /norestart /quiet" -Wait -PassThru).ExitCode}
        Invoke-Command -ComputerName $server -ScriptBlock $SB -Verbose
        if ($LASTEXITCODE -eq '0') 
            { 
                Write-host "Update was installed successfully on $server" -ForegroundColor Green 
                Remove-Item -Path $remotePathUpdates -Recurse
                Write-host "Directory was removed successfully on $server" -ForegroundColor Green 
            }
        if ($LASTEXITCODE -eq '3010')
            {
                Write-Host "Update was installed and required a reboot"
            } 
                 
    }
}