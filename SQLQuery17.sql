/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (100000) [MachineID]
      ,[InstanceKey]
      ,[TimeKey]
      ,[RevisionID]
      ,[AgentID]
      --,[rowversion]
     -- ,[Caption00]
      ,[Description00]
      ,[FixComments00]
      ,[HotFixID00]
      ,[InstallDate00]
      ,[InstalledBy00]
      ,[InstalledOn00]
      ,[Name00]
      ,[ServicePackInEffect00]
      ,[Status00]
  FROM [CM_PRM].[dbo].[QUICK_FIX_ENGINEERING_DATA]
  order by InstallDate00