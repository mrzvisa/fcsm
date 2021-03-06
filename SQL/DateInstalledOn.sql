/****** Script for SelectTopNRows command from SSMS  ******/
SELECT --TOP (10) 
[MachineID]
,SMS_R_System.Netbios_Name0
     -- ,[InstanceKey]
    --  ,[TimeKey]
    --  ,[RevisionID]
    --  ,[AgentID]
    --  ,[rowversion]
    --  ,[Caption00]
    --  ,[Description00]
    --  ,[FixComments00]
    --  ,[HotFixID00]
     -- ,[InstallDate00]
     -- ,[InstalledBy00]
	 ,max(convert(date,InstalledOn00))
	 --,InstalledOn00
	 --,convert(datetime,InstalledOn00) as Date2
  -- ,max(convert(datetime,convert(varchar,InstalledOn00))) as date2
	  --,[Name00]
   --   ,[ServicePackInEffect00]
    --  ,[Status00]
  FROM [CM_PRM].[dbo].[QUICK_FIX_ENGINEERING_DATA]
  Inner join vSMS_R_System AS SMS_R_System on QUICK_FIX_ENGINEERING_DATA.MachineID = SMS_R_System.ItemKey 
  where try_convert(datetime,InstalledOn00) is not null
 group by  MachineID, Netbios_Name0--, convert(datetime,InstalledOn00)
  order by 3


 
  