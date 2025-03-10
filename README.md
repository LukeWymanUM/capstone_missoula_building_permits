# Missoula Building Permit & Community Development Dashboard

## Project Overview
This project automates building permit metrics and community development reporting for Missoula's Community Planning, Development & Innovation department. It transforms manual, limited reporting methods into accessible, automated dashboards that provide valuable insights to both the department and the public.

The solution consists data pipelines that extract information from Excel workbooks and the department's SQL database. Then, the data is carefully transformed into data sets that feed metrics and visualizations in ArcGIS dashboards, supporting long-term community development goals.

## Repository Structure
- **01 Building Permit Metrics**: Contains notebooks and scripts related to the "Building Permit Metrics" 
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

## Technologies Used
- Excel (data processing)
- Python (data extraction, processing, and transformation)
- SQLite/SQL (data extraction and processing from department database)
- ArcGIS/Arcade (dashboard creation and digital product)