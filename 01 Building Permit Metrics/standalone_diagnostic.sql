-- Standalone diagnostic query for permit 2021-MSS-RES-01014
SELECT
    B1PERMIT.B1_ALT_ID,
    B1PERMIT.B1_PER_ID1,
    B1PERMIT.B1_PER_ID2,
    B1PERMIT.B1_PER_ID3,
    B1PERMIT.B1_PER_TYPE,
    CASE 
        WHEN B1PERMIT.B1_PER_TYPE = 'Residential Construction' THEN 'Residential'
        WHEN B1PERMIT.B1_PER_TYPE = 'Commercial Construction' THEN 'Commercial'
        ELSE 'Unknown'
    END AS B1_PER_TYPE_Formatted,
    PT.B1_CHECKBOX_DESC AS SubType_CheckboxDesc,
    PT.B1_CHECKLIST_COMMENT AS PERMIT_TYPE_x,
    NC.B1_CHECKBOX_DESC AS NewConst_CheckboxDesc,
    NC.B1_CHECKLIST_COMMENT AS NewConst_Value,
    CASE
        WHEN NC.B1_CHECKLIST_COMMENT = 'CHECKED' THEN 'New Construction'
        ELSE 'Addition/Remodel'
    END AS Project_Type
FROM 
    B1PERMIT
LEFT JOIN 
    BCHCKBOX PT ON B1PERMIT.B1_PER_ID1 = PT.B1_PER_ID1
        AND B1PERMIT.B1_PER_ID2 = PT.B1_PER_ID2
        AND B1PERMIT.B1_PER_ID3 = PT.B1_PER_ID3
        AND PT.B1_CHECKBOX_DESC IN ('Commercial Subtype', 'Residential Subtype')
LEFT JOIN 
    BCHCKBOX NC ON B1PERMIT.B1_PER_ID1 = NC.B1_PER_ID1
        AND B1PERMIT.B1_PER_ID2 = NC.B1_PER_ID2
        AND B1PERMIT.B1_PER_ID3 = NC.B1_PER_ID3
        AND NC.B1_CHECKBOX_DESC = 'New Construction'
WHERE 
    B1PERMIT.B1_ALT_ID = '2021-MSS-RES-01014'
    AND B1PERMIT.B1_PER_GROUP = 'Building'
    AND B1PERMIT.B1_PER_TYPE IN ('Residential Construction', 'Commercial Construction'); 