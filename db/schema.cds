using {
  cuid,
  managed
} from '@sap/cds/common';

namespace com.sovanta.gtm.event.tracker;

entity Events : cuid, managed {
  eventName      : String(200) @mandatory;
  eventDate      : Date @mandatory;
  location       : String(200);
  status         : String(20) default 'Planning';
  expectedGuests : Integer default 0;
  description    : String(5000);
}
