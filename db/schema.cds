namespace carriermanagement;
 using { managed } from '@sap/cds/common';

 entity Carriers : managed {
    key ID : UUID @(Core.Computed : true);
    carrid : String(3);
    carrname : String(20);
    schedules: Integer;
    country : Association to Countries;
    credit : Association to Credits;
    currcode : String(3);
    url : String(64);
    criticality : Integer;
 }

 entity Credits : managed {
    key ID : UUID @(Core.Computed : true);
    grade: String(1);
    descr : String;
    carriers : Association to many Carriers on carriers.credit = $self;
 }

using { API_COUNTRY_SRV as external } from '../srv/external/API_COUNTRY_SRV.csn';
entity Countries as projection on external.A_Country {
    key Country,
    CountryCurrency
}

