select name0, resource_domain_or_workgr0, operating_system_name_and0,
(select top 1 v_Update_ComplianceStatusReported.LastStatusChangeTime from v_Update_ComplianceStatusreported 
inner join v_updateinfo on v_UpdateInfo.ci_id = v_Update_ComplianceStatusreported.ci_id 
 where  status  in (3) and v_Updateinfo.CIType_ID not in (9) and v_r_system.ResourceID = v_Update_ComplianceStatusReported.ResourceId order by laststatuschangetime desc) as LastUpdated
from v_R_System --where Operating_System_Name_and0 like '%server%'
order by LastUpdated desc