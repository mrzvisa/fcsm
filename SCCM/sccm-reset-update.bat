@echo 1. Stopping Automatic Updates, BITS and SMS Host Agent Services...
net stop wuauserv
net stop bits
net stop ccmexec

@echo 2. Delete the qmgr*.dat files.
del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"

@echo 3. Rename the following folders to *.BAK
Ren %systemroot%\SoftwareDistribution\DataStore *.bak
Ren %systemroot%\SoftwareDistribution\Download *.bak
Ren %systemroot%\system32\catroot2 *.bak

@echo 4. b.Reset the BITS service and the Windows Update service to the default security descriptor.
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)

@echo 5. Deleting AU cache folder and log file...
del /f /q %SystemRoot%\WindowsUpdate.log
del /f /s /q %SystemRoot%\SoftwareDistribution\*.*

REM @echo 6. Renaming AU cache folder and log file...

REM ren %SystemRoot%\WindowsUpdate.log %SystemRoot%\WindowsUpdate.bak
REM ren %SystemRoot%\SoftwareDistribution %SystemRoot%\SoftwareDistribution.bak

@echo 6. Re-registering DLL files...
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\atl.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\jscript.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\msxml3.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\softpub.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wuapi.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wuaueng.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wuaueng1.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wucltui.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wups.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wups2.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wuweb.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\urlmon.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\mshtml.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\shdocvw.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\browseui.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\vbscript.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\scrrun.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\msxml.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\msxml6.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\actxprxy.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wintrust.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\dssenh.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\rsaenh.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\gpkcsp.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\sccbase.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\slbcsp.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\cryptdlg.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\oleaut32.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\ole32.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\shell32.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\initpki.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\qmgr.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\qmgrprxy.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wucltux.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\muweb.dll
%SystemRoot%\system32\regsvr32.exe /s %SystemRoot%\system32\wuwebv.dll


@echo 7. Reset Winsock
netsh winsock reset

@echo 8. Reset the proxy settings
netsh winhttp reset proxy

@echo 9. Removing WSUS Client Id...
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f

@echo 10. Starting Automatic Updates, BITS and SMS Host Agent Services...
net start ccmexec
net start bits
net start wuauserv

@echo 11. Forcing AU discovery...
wuauclt /resetauthorization /detectnow