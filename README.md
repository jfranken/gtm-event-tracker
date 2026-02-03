# GTM Event Tracker

A centralized go-to-market event management application built on SAP Cloud Application Programming Model (CAP) and delivered through SAP Fiori Elements. This solution provides a single, consistent source of truth for planning, executing, and monitoring events while minimizing manual coordination effort.

## Overview

The GTM Event Tracker is designed to streamline event management by integrating all relevant information into a structured domain model. It ensures that data about events, responsibilities, tasks, and costs is tightly integrated and always up to date.

### Key Features

- **Event Master Data Management**: Create and maintain events with essential details including name, date, location, status, expected guests, and description
- **Draft Support**: Comfortable data entry with auto-save functionality
- **Value Help**: Dropdown selection for status field with predefined values (Planning, Confirmed, Completed, Cancelled)
- **Data Validation**: Business logic ensures data quality with automatic validation of event name, date, and guest counts

## Data Model

### Core Entity

- **Events**: Central entity containing event details with the following fields:
  - `eventName`: String (200) - mandatory
  - `eventDate`: Date - mandatory  
  - `location`: String (200) - optional
  - `status`: String enum (Planning, Confirmed, Completed, Cancelled) - default 'Planning'
  - `expectedGuests`: Integer - default 0
  - `description`: String (5000) - large text for detailed descriptions
  - Managed fields: `createdAt`, `createdBy`, `modifiedAt`, `modifiedBy` (automatic)

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
- **[db/schema.cds](db/schema.cds)** - Database schema with Events entity
- **[srv/app-service.cds](srv/app-service.cds)** - OData service definition (EventsService) with UI annotations
- **[srv/app-service.js](srv/app-service.js)** - Service implementation with validation logic and value help
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

