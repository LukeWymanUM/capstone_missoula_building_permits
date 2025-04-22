# Arcade Data Expressions for Building Permit Metrics Dashboard

This document contains the Arcade data expressions used in the Building Permit Metrics dashboard. Each expression is documented with its purpose, usage, and technical details.

## Overview
Arcade data expressions are used in the Building Permit Metrics dashboard to:
- Transform and aggregate data from the SQL query
- Create calculated fields for visualizations
- Enable dynamic filtering and analysis
- Support interactive dashboard features

## Expressions

### Average Processing Timeaeates a formatted HTML popup showing key**Purpose**: 
**Usage**: 

### Cycle Count
```arcade
// Expression code here
```

**Purpose**: Counts the number of cycles a permit has gone through
**Usage**: Used in cycle analysis visualizations
**Parameters**: 
- `cycle_id`: Current cycle identifier
- `responsible_party`: Party responsible for current cycle

**Notes**: 
- Resets count when permit changes responsible party
- Maximum count capped at 5+

### Time with Party
```arcade
// Expression code here
```

**Purpose**: Calculates total time spent with each responsible party
**Usage**: Used in performance metrics
**Parameters**: 
- `days_in_process`: Days in current process
- `responsible_party`: Current responsible party

**Notes**: 
- Aggregates time across all cycles
- Handles transitions between parties

### Permit Type Distribution
```arcade
// Expression code here
```

**Purpose**: Calculates distribution of permit types
**Usage**: Used in permit type analysis
**Parameters**: 
- `permit_type`: Type of permit
- `permit_subtype`: Subtype of permit

**Notes**: 
- Groups similar permit types
- Handles null subtypes

### Current Status
```arcade
// Expression code here
```

**Purpose**: Determines current status of permit
**Usage**: Used in status tracking visualizations
**Parameters**: 
- `cycle`: Current cycle
- `process_status`: Current process status

**Notes**: 
- Updates in real-time
- Handles edge cases for new permits

### Permit Processing Time with Owner
**Purpose**: Calculates maximum processing time for each permit within each cycle while preserving the responsible process owner.
**Usage**: Used in performance analysis and tracking.

```arcade
// Create a portal connection
var portal = Portal('https://www.arcgis.com');

// Get feature set from portal item
var fs = FeatureSetByPortalItem(
    portal,
    '92baab2df82748d393edf63ff0397caa',
    0,
    [
        'Permit_ID',
        'Permit_Type',
        'Permit_Subtype',
        'Project_Type',
        'Process_Code',
        'Current_Process_Status',
        'Permit_Open_Year',
        'Permit_Open_Month',
        'Permit_Issued_Year',
        'Permit_Issued_Month',
        'Cycle_Number',
        'Process_Owner',
        'Process_Decision',
        'Process_Decision_Date',
        'Responsible_Party_Department',
        'Responsible_Party_Name',
        'Days_To_Review_Completion'
    ],
    false
);

// Filter for issued permits and specific process owners
var fs = Filter(fs, "Permit_Issued_Year IS NOT NULL AND Process_Owner IN ('Permit Approval', 'Issue Permit', 'Review Consolidation')");

// Group by permit and cycle to get max days
var maxDays = GroupBy(fs,
    ['Permit_ID', 'Cycle_Number'],
    [{name: 'Max_Days', expression: 'Days_To_Review_Completion', statistic: 'MAX'}]
);

// Create result array
var result = [];

// Process each group
for (var group in maxDays) {
    var permitId = group.Permit_ID;
    var cycleNumber = group.Cycle_Number;
    var maxDay = group.Max_Days;
    
    // Find matching record
    var matchingRecords = Filter(fs, 
        "Permit_ID = '" + permitId + "' AND Cycle_Number = " + cycleNumber + " AND Days_To_Review_Completion = " + maxDay
    );
    
    if (Count(matchingRecords) > 0) {
        var matchingRecord = First(matchingRecords);
        Push(result, {
            Permit_ID: permitId,
            Permit_Type: matchingRecord.Permit_Type,
            Permit_Subtype: matchingRecord.Permit_Subtype,
            Project_Type: matchingRecord.Project_Type,
            Process_Code: matchingRecord.Process_Code,
            Current_Process_Status: matchingRecord.Current_Process_Status,
            Permit_Open_Year: matchingRecord.Permit_Open_Year,
            Permit_Open_Month: matchingRecord.Permit_Open_Month,
            Permit_Issued_Year: matchingRecord.Permit_Issued_Year,
            Permit_Issued_Month: matchingRecord.Permit_Issued_Month,
            Cycle_Number: cycleNumber,
            Process_Owner: matchingRecord.Process_Owner,
            Days_To_Review_Completion: maxDay
        });
    }
}

return result;
```

## Best Practices
1. Always include error handling
2. Document all parameters
3. Use consistent naming conventions
4. Include comments for complex logic
5. Test expressions with edge cases

## Troubleshooting
Common issues and solutions:
1. Expression timing out
2. Null value handling
3. Performance optimization
4. Data type conversionsugust",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
};

// Get month name from dictionary, default to "Unknown" if not found
var monthName = monthNames[$datapoint.Permit_Open_Month] || "Unknown";

// Format year without commas
var year = Text($datapoint.Permit_Open_Year, '#');

// Define popup style
var popupStyle = `
    background-color: #4477AA;
    border-radius: 6px;
    color: #ffffff;
    font-family: sans-serif;
    font-size: 14px;
    padding: 10px;
`;

// Create HTML content using template literals for better readability
var html = `
    <div style='${popupStyle}'>
        <div><strong>Permit ID:</strong> ${$datapoint.Permit_ID}</div>
        <div><strong>Permit Type:</strong> ${$datapoint.Permit_Type}</div>
        <div><strong>Subtype:</strong> ${$datapoint.Permit_Subtype}</div>
        <div><strong>Project Type:</strong> ${$datapoint.Project_Type}</div>
        <div><strong>Current Status:</strong> ${$datapoint.Current_Process_Status}</div>
        <div><strong>Responsible Party:</strong> ${$datapoint.Current_Responsible_Party}</div>
        <div><strong>Opened:</strong> ${monthName} ${year}</div>
        <div><strong>Max Days Open (Party):</strong> ${$datapoint.Max_Days_Responsible_Party_Open}</div>
    </div>
`;

return html;
```

### Expression
**Purpose**: 
**Usage**: 

```arcade
// Expression code here
```

### Expression
**Purpose**: 
**Usage**: 

```arcade
// Expression code here
```

### Expression
**Purpose**: 
**Usage**: 

```arcade
// Expression code here
```

### Expression
**Purpose**: 
**Usage**: 

```arcade
// Expression code here
```

### Expression
**Purpose**: 
**Usage**: 

```arcade
// Expression code here
```