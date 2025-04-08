WITH FilteredPermitCheck AS (
    SELECT B1_ALT_ID, B1_PER_ID1, B1_PER_ID2, B1_PER_ID3 
    FROM B1PERMIT
    WHERE B1_ALT_ID = '2021-MSS-RES-01014'
),
PermitTypeCheck AS (
    SELECT 
        BCHCKBOX.B1_PER_ID1,
        BCHCKBOX.B1_PER_ID2,
        BCHCKBOX.B1_PER_ID3,
        BCHCKBOX.B1_CHECKBOX_DESC,
        BCHCKBOX.B1_CHECKLIST_COMMENT
    FROM 
        BCHCKBOX
    JOIN 
        FilteredPermitCheck 
            ON BCHCKBOX.B1_PER_ID1 = FilteredPermitCheck.B1_PER_ID1
            AND BCHCKBOX.B1_PER_ID2 = FilteredPermitCheck.B1_PER_ID2
            AND BCHCKBOX.B1_PER_ID3 = FilteredPermitCheck.B1_PER_ID3
    WHERE 
        BCHCKBOX.B1_CHECKBOX_DESC IN ('Commercial Subtype', 'Residential Subtype')
),
ProjectTypeCheck AS (
    SELECT
        BCHCKBOX.B1_PER_ID1,
        BCHCKBOX.B1_PER_ID2,
        BCHCKBOX.B1_PER_ID3,
        BCHCKBOX.B1_CHECKBOX_DESC,
        BCHCKBOX.B1_CHECKLIST_COMMENT
    FROM 
        BCHCKBOX
    JOIN 
        FilteredPermitCheck 
            ON BCHCKBOX.B1_PER_ID1 = FilteredPermitCheck.B1_PER_ID1
            AND BCHCKBOX.B1_PER_ID2 = FilteredPermitCheck.B1_PER_ID2
            AND BCHCKBOX.B1_PER_ID3 = FilteredPermitCheck.B1_PER_ID3
    WHERE 
        BCHCKBOX.B1_CHECKBOX_DESC = 'New Construction'
),
JoinCheck AS (
    SELECT 
        FP.B1_ALT_ID,
        FP.B1_PER_ID1,
        FP.B1_PER_ID2,
        FP.B1_PER_ID3,
        PT.B1_PER_ID1 AS PT_ID1,
        PT.B1_PER_ID2 AS PT_ID2,
        PT.B1_PER_ID3 AS PT_ID3,
        PR.B1_PER_ID1 AS PR_ID1,
        PR.B1_PER_ID2 AS PR_ID2,
        PR.B1_PER_ID3 AS PR_ID3,
        CASE WHEN PT.B1_PER_ID1 IS NULL THEN 'Missing in PERMIT_TYPE' ELSE 'Found in PERMIT_TYPE' END AS PermitTypeStatus,
        CASE WHEN PR.B1_PER_ID1 IS NULL THEN 'Missing in PROJECT_TYPE' ELSE 'Found in PROJECT_TYPE' END AS ProjectTypeStatus
    FROM 
        FilteredPermitCheck FP
    LEFT JOIN
        (SELECT DISTINCT B1_PER_ID1, B1_PER_ID2, B1_PER_ID3 FROM PermitTypeCheck) PT
            ON FP.B1_PER_ID1 = PT.B1_PER_ID1
            AND FP.B1_PER_ID2 = PT.B1_PER_ID2
            AND FP.B1_PER_ID3 = PT.B1_PER_ID3
    LEFT JOIN
        (SELECT DISTINCT B1_PER_ID1, B1_PER_ID2, B1_PER_ID3 FROM ProjectTypeCheck) PR
            ON FP.B1_PER_ID1 = PR.B1_PER_ID1
            AND FP.B1_PER_ID2 = PR.B1_PER_ID2
            AND FP.B1_PER_ID3 = PR.B1_PER_ID3
)

-- Check all results to see where the data fails to join
SELECT 'FILTERED_PERMITS' AS Check_Type, * FROM FilteredPermitCheck;
SELECT 'PERMIT_TYPE' AS Check_Type, * FROM PermitTypeCheck;
SELECT 'PROJECT_TYPE' AS Check_Type, * FROM ProjectTypeCheck;
SELECT 'JOIN_CHECK' AS Check_Type, * FROM JoinCheck;

-- Check if the permit appears in the FILTERED_PERMITS in the main query
SELECT 'MAIN_FILTERED_PERMITS' AS Check_Type, *
FROM B1PERMIT
WHERE B1PERMIT.B1_PER_GROUP = 'Building'
AND B1PERMIT.B1_PER_TYPE IN ('Residential Construction', 'Commercial Construction')
AND B1_APPL_CLASS = 'COMPLETE'
AND B1_APPL_STATUS NOT IN ('Closed', 'Withdrawn', 'Refunded')
AND CONVERT(DATE, B1PERMIT.B1_FILE_DD) >= '2020-01-01'
AND B1_ALT_ID = '2021-MSS-RES-01014'; 