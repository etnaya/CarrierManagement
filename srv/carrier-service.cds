using { carriermanagement as cm } from '../db/schema';

@path: 'service/carrier'

service CarrierService {
    @odata.draft.enabled
    entity Carriers  as projection on cm.Carriers;
        
    @odata.draft.enabled
    entity Credits as projection on cm.Credits;

    entity Countries as projection on cm.Countries;
}








    