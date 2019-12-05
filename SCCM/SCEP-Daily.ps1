add-pssnapin *exchange* -erroraction SilentlyContinue
$StartDate = (Get-Date -Hour 0 -Minute 0 -Second 1).AddMonths(-1)
$EndDate = (Get-Date -Hour 23 -Minute 59 -Second 59).AddDays(-1) 

$DateStart = get-date ((Get-Date -Hour 23 -Minute 59 -Second 59).AddDays(-1)) -UFormat "%d.%m.%y"
$DateStartSixMonthAgo = get-date ((Get-Date -Hour 23 -Minute 59 -Second 59).AddMonths(-6)) -UFormat "%d.%m.%y"
$DateEnd = get-date -UFormat "%d.%m.%y"


$StartDay =  ($StartDate).Day
$StartMonth = ($StartDate).Month
$StartYear = ($StartDate).Year
$EndDay =  ($EndDate).Day
$EndMonth = ($EndDate).Month
$EndYear = ($EndDate).Year
$Server = "smtp16.ooosgm.ru" # SMTP Сервер
$From = "sccm@ooosgm.ru" # Адрес отправителя
#$To = "biryukov_as@ooosgm.ru" # Получатель
$Subject = "SCEP Daily: Infected computers and Antimalware activity report" # Тема сообщения
$Body = "В теле письма ссылки на два отчета, которые отображают угрозы и зараженные компьютеры. Каждый отчет доступен за период с " + $DateStart + " по " + $DateEnd + " и с " + $DateStartSixMonthAgo + " по " + $DateEnd +" (6 месяцев). Источник данных - все серверные ОС c Microsoft Endpoint Protection. Есть возможность детализировать и организовывать информацию." # Тело сообщения


$ReportLink1 = "http://sql021/ReportServer?%2FConfigMgr_PRM%2FEndpoint%20Protection%2FInfected%20computers&StartDate=" +$DateStart + "%200%3A00%3A00&UserName%3Aisnull=True&ThreatName%3Aisnull=True&InfectionStatus%3Aisnull=True&CleaningAction%3Aisnull=True&EndDate=" + $DateEnd + "%200%3A00%3A00&CollectionID=PRM0001A&rs%3AParameterLanguage=ru-RU"
$ReportLink2 = "http://sql021/ReportServer?%2FConfigMgr_PRM%2FEndpoint%20Protection%2FAntimalware%20activity%20report&StartDate=" + $DateStart + "%200%3A00%3A00&CollectionID=PRM0001A&EndDate=" + $DateEnd + "%200%3A00%3A00&rs%3AParameterLanguage=ru-RU"
$ReportLink3 = "http://sql021/ReportServer?%2FConfigMgr_PRM%2FEndpoint%20Protection%2FInfected%20computers&StartDate=" +$DateStartSixMonthAgo + "%200%3A00%3A00&UserName%3Aisnull=True&ThreatName%3Aisnull=True&InfectionStatus%3Aisnull=True&CleaningAction%3Aisnull=True&EndDate=" + $DateEnd + "%200%3A00%3A00&CollectionID=PRM0001A&rs%3AParameterLanguage=ru-RU"
$ReportLink4 = "http://sql021/ReportServer?%2FConfigMgr_PRM%2FEndpoint%20Protection%2FAntimalware%20activity%20report&StartDate=" + $DateStartSixMonthAgo + "%200%3A00%3A00&CollectionID=PRM0001A&EndDate=" + $DateEnd + "%200%3A00%3A00&rs%3AParameterLanguage=ru-RU"

$Body1 = "Infected Computers Current (" + $DateStart + " по " + $DateEnd +"): " + [System.Environment]::NewLine +  $ReportLink1
$Body2 = "Infected Computers 6 Months (" + $DateStartSixMonthAgo + " по " + $DateEnd +"): " + [System.Environment]::NewLine +  $ReportLink3
$Body3 = "Antimalware Activity Report Current (" + $DateStart + " по " + $DateEnd +"): " + [System.Environment]::NewLine +  $ReportLink2
$Body4 = "Antimalware Activity Report 6 Months (" + $DateStartSixMonthAgo + " по " + $DateEnd +"): " + [System.Environment]::NewLine +  $ReportLink4



$SmtpClient = New-Object System.Net.Mail.SmtpClient
$Message = New-Object System.Net.Mail.MailMessage
$SmtpClient.Host = $Server
$Message.From = $From
#$Message.To.Add($To)
$Message.To.Add("vinnikov_aa@ooosgm.ru")
$Message.To.Add("figaro@ooosgm.ru")
$Message.To.Add("ohremenko_ev@ooosgm.ru")
$Message.To.Add("berezhnoy_iv@ooosgm.ru")
$Message.To.Add("biryukov_as@ooosgm.ru")


$Message.Subject = $Subject
$Message.Body =  $Body + [System.Environment]::NewLine + [System.Environment]::NewLine+ $Body1 + [System.Environment]::NewLine + [System.Environment]::NewLine + $Body2 + [System.Environment]::NewLine + [System.Environment]::NewLine + $Body3 + [System.Environment]::NewLine+ [System.Environment]::NewLine + $body4 

$SmtpClient.Send($Message)
$Message.Dispose()
#exit