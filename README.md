# Building Missoula: Interactive Permit & Development Data Dashboards

<div align="center">
  <img src="resources/UM_logo.png" alt="UM Logo" height="150" style="margin-right: 50px"/>
  <img src="resources/Missoula_logo.jpeg" alt="Missoula Logo" height="150"/>
</div>

<div align="center">
  <em>Project by Luke Wyman of the University of Montana in Collaboration with City of Missoula Community Planning, Development & Innovation</em>
</div>

## Project Overview
This project revolutionizes how Missoula's Community Planning, Development & Innovation (CPDI) department manages and communicates building permit data and community development metrics. By replacing manual, time-consuming reporting processes with automated data pipelines and interactive dashboards, this project seeks to transform how the city tracks, analyzes, and shares critical development information.

The solution integrates data from the department's SQL database and Excel workbooks, transforming it into comprehensive, easy-to-understand visualizations in ArcGIS dashboards. This not only saves valuable staff time but also provides the first real insights into this information, enhancing transparency and public understanding of the city's development processes.

## Repository Structure
- **01 Building Permit Metrics**: Contains notebooks and scripts related to the "Building Permit Metrics" dashboard.
- **02 Building Permit Operational Insights**: Contains notebooks and scripts related to the "Building Permit Operational Insights" dashboard.
- **03 Community Development Snapshots**: Contains notebooks and scripts related to the "Community Development Snapshots" dashboard.
- **Business Requirement Documents**: Contains versions of the documentation outlining the project requirements and objectives provided by stakeholders.
- **Permit Data Inventory**: Contains versions of a catalog of available permit data sources, fields, and their definitions.
- **outline.txt**: General project outline and development roadmap.
- **three_ps_wyman.txt**: Provides updates on the project.

## Data Products
#### This project delivers three primary data products:

1. **Building Permit Metrics**: 
   - Completely developed and automated data pipeline, going from raw back-end SQL database tables to data sets rich for visualizations
   - Fully automated visualizations of permit processing times, volumes, and types
   - Public-facing metrics that improve overall transparency and understanding of the permitting process

2. **Building Permit Operational Insights**:
   - Completely developed and automated data pipeline, going from raw back-end database tables to data sets rich for visualizations
   - Fully automated visualizations of permit processing times, volumes, and types specific to internal, CPDI teams
   - Internal-facing metrics that allow for performance benchmarking against to-be established KPIs

3. **Community Development Snapshots**:
   - Replication of community development monthly, quarterly, and yearly snapshots of permit financials
   - Initially developed and partially automated data pipeline, going from audited fiscal year Excel reports to data sets rich for visualizations
   - Consolidated data from multiple years located in a dashboard that empowers community members to find new, longer-term insights about city development

## Data Sources
- **SQL Database**: Primary source for building permit data
  - Contains permit applications, processing times, and status information
  - Updated in real-time as permits are processed
- **Excel Workbooks**: Secondary source for financial and historical data
  - Contains audited fiscal year reports
  - Updated monthly/quarterly/annually

## Technologies Used
- **Data Processing**:
  - Python (pandas, numpy, sqlite3)
  - Excel
  - SQLite/SQL
- **Visualization**:
  - ArcGIS/Arcade
  - ArcGIS Dashboards
- **Version Control**:
  - Git/GitHub

## Contributing
This project is part of a capstone project. For contributions or questions, please contact the project maintainers.

## License
[Specify your license here]

## Contact
[Add contact information for project maintainers]