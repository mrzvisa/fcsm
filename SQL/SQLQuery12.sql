select  distinct SMS_R_System.Netbios_Name0 as Name
--,SMS_GH_System_WINDOWSUPDATE.UseWUServer00
--,(__stem_QUICK_FIX_ENGINEERING0.HotFixID00)
--,max(convert(date,__stem_QUICK_FIX_ENGINEERING0.InstalledOn00)) as Date2
--,__stem_QUICK_FIX_ENGINEERING0.InstalledOn00 as MaxDateInstalled
--,__stem_QUICK_FIX_ENGINEERING0.TimeKey 
from vSMS_R_System AS SMS_R_System 
INNER JOIN WINDOWSUPDATE_HIST AS SMS_GH_System_WINDOWSUPDATE ON SMS_GH_System_WINDOWSUPDATE.MachineID = SMS_R_System.ItemKey  
INNER JOIN QUICK_FIX_ENGINEERING_DATA AS __stem_QUICK_FIX_ENGINEERING0 ON __stem_QUICK_FIX_ENGINEERING0.MachineID = SMS_R_System.ItemKey   
--OPTION(USE HINT('FORCE_LEGACY_CARDINALITY_ESTIMATION'))
where try_convert(date,__stem_QUICK_FIX_ENGINEERING0.InstalledOn00) is not null
--group by SMS_R_System.Netbios_Name0
order by Name