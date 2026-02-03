using EventService as service from '../../srv/app-service';

annotate service.Events with @(
    UI.HeaderInfo : {
        TypeName : 'Event',
        TypeNamePlural : 'Events',
        Title : {
            $Type : 'UI.DataField',
            Value : eventName,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : location,
        },
    },
    UI.SelectionFields : [
        status,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Event Name',
            Value : eventName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Event Date',
            Value : eventDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Location',
            Value : location,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
            Criticality : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Expected Guests',
            Value : expectedGuests,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total Cost',
            Value : totalEventCost,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Task Progress',
            Value : taskProgress,
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneralInformation',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneralInfo',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'CostSummary',
            Label : 'Cost Summary',
            Target : '@UI.FieldGroup#CostSummary',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Responsibilities',
            Label : 'Responsible Persons',
            Target : 'responsibilities/@UI.LineItem',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Tasks',
            Label : 'Tasks',
            Target : 'tasks/@UI.LineItem',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'CateringServices',
            Label : 'Catering Services',
            Target : 'cateringServices/@UI.LineItem',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BeverageServices',
            Label : 'Beverage Services',
            Target : 'beverageServices/@UI.LineItem',
        },
    ],
    UI.FieldGroup #GeneralInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Event Name',
                Value : eventName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Event Date',
                Value : eventDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Location',
                Value : location,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Expected Guests',
                Value : expectedGuests,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },
        ],
    },
    UI.FieldGroup #CostSummary : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Total Catering Cost',
                Value : totalCateringCost,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Total Beverage Cost',
                Value : totalBeverageCost,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Total Event Cost',
                Value : totalEventCost,
            },
        ],
    },
);

annotate service.EventResponsibilities with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Person',
            Value : person.firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Last Name',
            Value : person.lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : person.email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Responsibility Type',
            Value : responsibilityType,
        },
    ]
);

annotate service.Tasks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Task Name',
            Value : taskName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Due Date',
            Value : dueDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
            Criticality : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Priority',
            Value : priority,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Responsible Person',
            Value : responsiblePerson.firstName,
        },
    ]
);

annotate service.CateringServices with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Service Name',
            Value : serviceName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Service Type',
            Value : serviceType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price per Person',
            Value : pricePerPerson,
        },
    ]
);

annotate service.BeverageServices with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Service Name',
            Value : serviceName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Beverage Type',
            Value : beverageType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price per Person',
            Value : pricePerPerson,
        },
    ]
);

