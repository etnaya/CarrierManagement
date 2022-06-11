using carriermanagement as cm from '../db/schema';

annotate cm.Carriers with {
    ID @title : 'Carrier';
    carrid @title : 'Carrier ID';
    carrname @title : 'Name';
    country @title : 'Country';
    schedules @title : 'Number of Schedules';
    credit @title : 'Credit Rating';    
    currcode @title : 'Currency';
    url @title : 'Homepage';
}

annotate cm.Carriers with {
    credit @(Common : {
        Text : credit.grade,
        TextArrangement : #TextOnly,
        ValueList : {
            Label : 'Credit Rating List', //팝업 창의 타이틀 
            CollectionPath : 'Credits',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'credit_ID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'grade'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                }
            ]
        }
    });

    country @(Common : {
        Text : country_Country,
        TextArrangement : #TextOnly,
        ValueList : {
            Label : 'Country List', //팝업 창의 타이틀 
            CollectionPath : 'Countries',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'country_Country',
                    ValueListProperty : 'Country'
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'currcode',
                    ValueListProperty : 'CountryCurrency'
                }
            ]
        }
    });

}