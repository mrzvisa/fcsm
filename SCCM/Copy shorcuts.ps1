Copy-Item -Path "\\Srv-sccm-dp02\sccm\APP\OTP\Windows10LTSC\StartLauout\SGM\Инструкции по работе с телефонами.lnk" -Destination $env:Public'\Desktop\' -Force
Copy-Item -Path "\\Srv-sccm-dp02\sccm\APP\OTP\Windows10LTSC\StartLauout\SGM\Файловый сервер - диск Z.lnk" -Destination $env:Public'\Desktop\' -Force
Copy-Item -Path $env:ALLUSERSPROFILE'\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\outlook 2013.lnk' -Destination $env:Public'\Desktop\Электронная почта.lnk' -Force
