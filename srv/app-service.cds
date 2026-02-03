using {com.sovanta.gtm.event.tracker as my} from '../db/schema';

// Define status type as enum
type StatusType : String enum {
  Planning;
  Confirmed;
  Completed;
  Cancelled;
}

service EventsService @(path: '/odata/v4/com-sovanta-gtm-event-tracker-service') {
  @odata.draft.enabled
  entity Events as projection on my.Events {
    *,
    status : StatusType @(
      title: 'Status',
      Common.ValueList: {
        CollectionPath: 'StatusValues',
        Parameters: [
          {
            $Type: 'Common.ValueListParameterInOut',
            LocalDataProperty: status,
            ValueListProperty: 'code'
          },
          {
            $Type: 'Common.ValueListParameterDisplayOnly',
            ValueListProperty: 'name'
          }
        ]
      }
    )
  } actions {
    // Future actions can be added here
  };

  // Value help entity for status
  @cds.persistence.skip
  entity StatusValues {
    key code : String;
    name : String;
  }
}

// Annotations for Events entity
annotate EventsService.Events with @(
  title: 'Event',
  Common.Label: 'Event',
  UI.SelectionFields: [status, eventDate],
  UI.LineItem: [
    {
      $Type: 'UI.DataField',
      Label: 'Event Name',
      Value: eventName
    },
    {
      $Type: 'UI.DataField',
      Label: 'Event Date',
      Value: eventDate
    },
    {
      $Type: 'UI.DataField',
      Label: 'Location',
      Value: location
    },
    {
      $Type: 'UI.DataField',
      Label: 'Status',
      Value: status
    },
    {
      $Type: 'UI.DataField',
      Label: 'Expected Guests',
      Value: expectedGuests
    }
  ],
  UI.HeaderInfo: {
    TypeName: 'Event',
    TypeNamePlural: 'Events',
    Title: {
      $Type: 'UI.DataField',
      Value: eventName
    },
    Description: {
      $Type: 'UI.DataField',
      Value: eventDate
    }
  },
  UI.HeaderFacets: [
    {
      $Type: 'UI.ReferenceFacet',
      Label: 'Key Information',
      Target: '@UI.FieldGroup#HeaderData'
    }
  ],
  UI.FieldGroup #HeaderData: {
    Data: [
      {
        $Type: 'UI.DataField',
        Label: 'Status',
        Value: status
      },
      {
        $Type: 'UI.DataField',
        Label: 'Expected Guests',
        Value: expectedGuests
      },
      {
        $Type: 'UI.DataField',
        Label: 'Location',
        Value: location
      }
    ]
  },
  UI.Facets: [
    {
      $Type: 'UI.ReferenceFacet',
      Label: 'General Information',
      Target: '@UI.FieldGroup#GeneralInfo'
    }
  ],
  UI.FieldGroup #GeneralInfo: {
    Data: [
      {
        $Type: 'UI.DataField',
        Label: 'Event Name',
        Value: eventName
      },
      {
        $Type: 'UI.DataField',
        Label: 'Event Date',
        Value: eventDate
      },
      {
        $Type: 'UI.DataField',
        Label: 'Location',
        Value: location
      },
      {
        $Type: 'UI.DataField',
        Label: 'Status',
        Value: status
      },
      {
        $Type: 'UI.DataField',
        Label: 'Expected Guests',
        Value: expectedGuests
      },
      {
        $Type: 'UI.DataField',
        Label: 'Description',
        Value: description,
        ![@UI.MultiLineText]
      }
    ]
  }
);

// Field-level annotations
annotate EventsService.Events with {
  eventName @title: 'Event Name' @mandatory;
  eventDate @title: 'Event Date' @mandatory;
  location @title: 'Location';
  status @title: 'Status';
  expectedGuests @title: 'Expected Guests';
  description @title: 'Description' @UI.MultiLineText;
};
