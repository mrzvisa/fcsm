﻿$time=[datetime]::Today.AddDays(-90) 
Get-ADComputer -Filter {LastLogonDate -gt $time } -prop *|select name,LastLogonDate,OperatingSystem, whencreated, whenchanged, DistinguishedName, PasswordLastSet, ObjectClass, CanonicalName | Sort-Object name  | Export-Csv -Delimiter ";" C:\temp\ListAD90days.csv -NoTypeInformation