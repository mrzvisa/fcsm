﻿Invoke-Command -ComputerName svm101,svm102,svm103,svm104, svm107, svm109,svm110,svm111,svm112,svm113,svm114,svm108,svm106,svm105 -ScriptBlock {Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\ql2300\Parameters\Device -Name DriverParameter} | ft 