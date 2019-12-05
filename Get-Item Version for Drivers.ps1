Invoke-Command -ComputerName svm101,svm102,svm103,svm104, svm107, svm109,svm110,svm111,svm112,svm113,svm114,svm108,svm106,svm105 -ScriptBlock {(Get-Item C:\Windows\System32\drivers\mpio.sys).VersionInfo.fileversion} | ft 
Invoke-Command -ComputerName svm101,svm102,svm103,svm104, svm107, svm109,svm110,svm111,svm112,svm113,svm114,svm108,svm106,svm105 -ScriptBlock {(Get-Item C:\Windows\System32\drivers\mpio.sys )} | fl
Invoke-Command -ComputerName svm101,svm102,svm103,svm104,svm105,svm106, svm107, svm108,svm109,svm110,svm111,svm112,svm113,svm114 -ScriptBlock {[System.Diagnostics.FileVersionInfo]::GetVersionInfo("C:\Windows\System32\drivers\mpio.sys")} | Select-Object PSComputerName, FileVersionRaw, ProductVersionRaw, FileVersion, ProductVersion | Sort-Object PSComputerName | Out-GridView
Invoke-Command -ComputerName svm101,svm102,svm103,svm104,svm105,svm106, svm107, svm108,svm109,svm110,svm111,svm112,svm113,svm114 -ScriptBlock {(Get-WmiObject -Class CIM_DataFile -Filter "Name='C:\\Windows\\System32\\drivers\\mpio.sys'" | Select-Object Version).Version} | Out-GridView


