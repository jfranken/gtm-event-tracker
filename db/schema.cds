using {
  cuid,
  managed,
  Currency
} from '@sap/cds/common';

namespace com.sovanta.gtm.event.tracker;

entity Events : cuid, managed {
  eventName        : String @mandatory;
  eventDate        : Date @mandatory;
  location         : String;
  status           : String @mandatory default 'Planning';
  expectedGuests   : Integer default 0;
  description      : String(1000);
  
  // Compositions
  responsibilities : Composition of many EventResponsibilities on responsibilities.event = $self;
  tasks            : Composition of many Tasks on tasks.event = $self;
  cateringServices : Composition of many CateringServices on cateringServices.event = $self;
  beverageServices : Composition of many BeverageServices on beverageServices.event = $self;
  
  // Virtual calculated fields
  totalCateringCost : Decimal(10,2) @Core.Computed;
  totalBeverageCost : Decimal(10,2) @Core.Computed;
  totalEventCost    : Decimal(10,2) @Core.Computed;
  taskProgress      : String @Core.Computed;
}

entity Persons : cuid, managed {
  firstName : String @mandatory;
  lastName  : String @mandatory;
  email     : String;
  role      : String;
  
  // Association to responsibilities
  responsibilities : Association to many EventResponsibilities on responsibilities.person = $self;
}

entity EventResponsibilities : cuid, managed {
  event             : Association to Events;
  person            : Association to Persons;
  responsibilityType : String default 'Support';
}

entity Tasks : cuid, managed {
  event            : Association to Events;
  taskName         : String @mandatory;
  description      : String;
  dueDate          : Date;
  status           : String default 'Open';
  priority         : String default 'Medium';
  responsiblePerson : Association to Persons;
}

entity CateringServices : cuid, managed {
  event          : Association to Events;
  serviceName    : String @mandatory;
  description    : String;
  pricePerPerson : Decimal(10,2) @mandatory default 0;
  serviceType    : String;
  currency       : Currency default 'EUR';
}

entity BeverageServices : cuid, managed {
  event          : Association to Events;
  serviceName    : String @mandatory;
  description    : String;
  pricePerPerson : Decimal(10,2) @mandatory default 0;
  beverageType   : String;
  currency       : Currency default 'EUR';
}

// Enable draft for Events
annotate Events with @fiori.draft.enabled;
