# GTM Event Tracker

A centralized go-to-market event management application built on SAP Cloud Application Programming Model (CAP) and delivered through SAP Fiori Elements. This solution provides a single, consistent source of truth for planning, executing, and monitoring events while minimizing manual coordination effort.

## Overview

The GTM Event Tracker is designed to streamline event management by integrating all relevant information into a structured domain model. It ensures that data about events, responsibilities, tasks, and costs is tightly integrated and always up to date.

### Key Features

- **Event Master Data Management**: Create and maintain events with essential details including dates, locations, status, and guest counts
- **Responsibility Assignment**: Assign one or more responsible persons to events with clear accountability and ownership
- **Task Management**: Track tasks with lifecycle status (Open, In Progress, Done) to monitor progress and identify bottlenecks
- **Cost Management**: Automatically calculate catering and beverage costs based on per-person pricing and guest counts
- **Real-time Cost Transparency**: Total event costs are calculated automatically and updated when prices or guest numbers change
- **Comprehensive Reporting**: Filter events by status or responsible person, view task progress, and access cost summaries

## Data Model

### Core Entities

- **Events**: Central entity containing event details (name, date, location, status, expected guests)
- **Persons**: Team members who can be assigned responsibilities
- **EventResponsibilities**: Many-to-many relationship linking persons to events with responsibility types
- **Tasks**: Action items with status tracking, due dates, and assigned persons
- **CateringServices**: Food service items with per-person pricing
- **BeverageServices**: Beverage offerings with per-person pricing

### Calculated Fields

- `totalCateringCost`: Sum of all catering prices × expected guests
- `totalBeverageCost`: Sum of all beverage prices × expected guests
- `totalEventCost`: Total of catering and beverage costs
- `taskProgress`: Percentage of completed tasks

## Prerequisites

- [Node.js](https://nodejs.org/) (v18 or higher)
- [SAP Cloud Application Programming Model](https://cap.cloud.sap/docs/get-started/) - `npm install -g @sap/cds-dk`
- [Cloud MTA Build Tool](https://sap.github.io/cloud-mta-build-tool/) - `npm install -g mbt`
- [Cloud Foundry CLI](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html) (for deployment)

## Project Setup

### Installation

```bash
npm install
```

### Local Development

```bash
# Start server with hot-reload
cds watch

# Alternative: Open with specific UI
npm run watch-project
```

The application will be available at:
- UI: http://localhost:4004/com-sovanta-gtm-event-tracker-ui/webapp/index.html
- OData Service: http://localhost:4004/odata/v4/com-sovanta-gtm-event-tracker-service

### Database

```bash
# Deploy SQLite database locally
cds deploy

# With test data
cds deploy --with-mocks
```

## Cloud Foundry Deployment

### MTA Build & Deploy

```bash
# Create MTA archive
npm run mbt:build

# Deploy to Cloud Foundry
npm run cf:deploy
```

### Manual CF Commands

```bash
# Login
cf login -a <API_ENDPOINT>

# Deploy
cf deploy mta_archives/com-sovanta-gtm-event-tracker.mtar

# Check status
cf apps
cf services
```

## Project Structure

```
├── app/                          # UI5 Applications & Router
│   ├── router/                   # Application Router
│   └── com-sovanta-gtm-event-tracker-ui/  # Fiori Elements UI
├── db/                           # Database models (CDS Schema)
│   └── data/                     # CSV test data
├── srv/                          # Service definitions
├── test/                         # Test data
├── mta.yaml                      # Multi-Target Application Descriptor
└── package.json                  # Node.js Dependencies & Scripts
```

## Important Files

- **[mta.yaml](mta.yaml)** - Cloud Foundry deployment configuration
- **[db/schema.cds](db/schema.cds)** - Database schema with Events, Persons, Tasks, and Services
- **[srv/app-service.cds](srv/app-service.cds)** - OData service definitions (EventService)
- **[app/services.cds](app/services.cds)** - UI service annotations
- **[xs-security.json](xs-security.json)** - XSUAA security configuration

## Useful Commands

```bash
# Reset SQLite database
rm -f sqlite.db && cds deploy

# Add new entity (interactive)
cds add entity

# Build UI5 app
cd app/com-sovanta-gtm-event-tracker-ui
npm run build:cf

# Cloud Foundry logs
cf logs com-sovanta-gtm-event-tracker-srv --recent
```

## Technology Stack

- **Backend**: SAP Cloud Application Programming Model (CAP)
- **Frontend**: SAP Fiori Elements (UI5)
- **Database**: SAP HANA Cloud (Production) / SQLite (Development)
- **Auth**: XSUAA (Cloud) / Dummy Auth (Local)
- **Deployment**: Cloud Foundry MTA

## Further Resources

- [SAP CAP Documentation](https://cap.cloud.sap/docs/)
- [SAP Fiori Elements](https://ui5.sap.com/test-resources/sap/fe/core/fpmExplorer/index.html)
- [SAP UI5 Documentation](https://ui5.sap.com/)
- [Cloud Foundry Documentation](https://docs.cloudfoundry.org/)

