/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CI_ID]
      ,[ResourceID]
      ,[Status]
      ,[LastStatusCheckTime]
      ,[LastStatusChangeTime]
      ,[EnforcementSource]
      ,[LastEnforcementMessageID]
      ,[LastEnforcementMessageTime]
      ,[LastEnforcementStatusMsgID]
      ,[LastErrorCode]
      ,[LastLocalChangeTime]
  FROM [CM_PRM].[dbo].[v_Update_ComplianceStatusReported]
  order by ci_id, laststatuschecktime