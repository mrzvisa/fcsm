$PluginPath = "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x64\SharePoint.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x86\SharePoint.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x64\BoxFileSys.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x86\BoxFileSys.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x64\DropBox.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x86\DropBox.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x64\GoogleDrive.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x86\GoogleDrive.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x64\OneDrive.pvp",
              "$env:SystemDrive\Program Files\Tracker Software\PDF Editor\Plugins.x86\OneDrive.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x64\SharePoint.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x86\SharePoint.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x64\BoxFileSys.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x86\BoxFileSys.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x64\DropBox.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x86\DropBox.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x64\GoogleDrive.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x86\GoogleDrive.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x64\OneDrive.pvp",
              "$env:SystemDrive\Program Files (x86)\Tracker Software\PDF Editor\Plugins.x86\OneDrive.pvp"
#Устанавливаем PDF Editor
Start-Process PDF-XChange.Editor.Plus.v7.0.326.1.exe -ArgumentList '/S /Q' -NoNewWindow -Wait
#Убиваем процесс PDF Editor
Stop-Process -name "pdf*" -force
#Удаляем плагины SharePoint
$PluginPath | ForEach-Object { if (Test-Path -Path $_) { Remove-Item -path $_ -Force } }