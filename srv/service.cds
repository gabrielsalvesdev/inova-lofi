using { myApp } from '../db/schema.cds';

service myAppSrv {
  @odata.draft.enabled
  entity Genre as projection on myApp.Genre;
  @odata.draft.enabled
  entity Station as projection on myApp.Station;
}