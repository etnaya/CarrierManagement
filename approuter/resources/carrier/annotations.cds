using CarrierService as service from '../../srv/carrier-service';

// Risk List Report Page
 annotate CarrierService.Carriers with @(UI : {
    HeaderInfo : {
        TypeName : 'Carrier',
        TypeNamePlural : 'Carriers',
        Title : {
            $Type : 'UI.DataField',
            Value : carrid
        },
        Description : {
            $Type : 'UI.DataField',
            Value : carrname
        }
    },
    SelectionFields : [carrid],
    Identification : [{Value : carrname}],
    // Define the table columns
    LineItem : [
        {Value : carrid},
        {Value : carrname},
        {Value : country_Country },
        {
            Value : schedules,
            Criticality : criticality            
        },
        {Value : credit_ID},
        {Value : currcode},
        {Value : url}
    ]
 });

// Risk Object Page
 annotate CarrierService.Carriers with @(UI : {
    Facets : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target : '@UI.FieldGroup#Main',
    }],
    FieldGroup #Main : { Data : [
        {Value : carrid},
        {Value : carrname},
        {Value : country_Country },
        {Value : schedules},
        {Value : credit_ID},
        {Value : currcode},
        {Value : url}
    ]},
 });

