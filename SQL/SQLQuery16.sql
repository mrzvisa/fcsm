SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_NAME = 'QUICK_FIX_ENGINEERING_DATA' AND 
     COLUMN_NAME = 'InstalledOn00'