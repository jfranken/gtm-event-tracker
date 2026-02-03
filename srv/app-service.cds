using {com.sovanta.gtm.event.tracker as my} from '../db/schema';

service EventService @(path: '/odata/v4/com-sovanta-gtm-event-tracker-service') {
  entity Events as projection on my.Events;
  entity Persons as projection on my.Persons;
  entity EventResponsibilities as projection on my.EventResponsibilities;
  entity Tasks as projection on my.Tasks;
  entity CateringServices as projection on my.CateringServices;
  entity BeverageServices as projection on my.BeverageServices;
}
