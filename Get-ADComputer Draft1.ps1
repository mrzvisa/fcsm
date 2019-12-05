$time=[datetime]::Today.AddDays(-40) 
Get-ADComputer -Filter {enabled -eq "true" -and LastLogonDate -gt $time } -prop *|select name | measure

$time=[datetime]::Today.AddDays(-40) 
Get-ADComputer -Filter {LastLogonDate -gt $time } -prop *|select name | measure

$time=[datetime]::Today.AddDays(-40) 
Get-ADComputer -Filter {enabled -eq "false" -and LastLogonDate -gt $time } -prop *|select name | measure