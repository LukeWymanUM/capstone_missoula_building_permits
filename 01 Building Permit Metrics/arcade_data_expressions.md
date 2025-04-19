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