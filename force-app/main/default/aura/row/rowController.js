({
    handleLoad : function(cmp, event) {
        console.log('handleLoad');
    },
    handleSubmit : function(cmp, event) {
        console.log('handleSubmit');

        event.preventDefault();       // stop the form from submitting

        let 
            fields = event.getParam('fields');
        
        fields.Master__c = cmp.get('v.rowMasterId');
        
        cmp.find('rowForm').submit(fields);

    },
    handleSuccess : function(cmp, event) {
        console.log('handleSuccess');
    },
    masterUpdated : function(emp, event) {
        console.log('masterUpdated called');
        console.log(JSON.stringify(event.getParams()));
    },
    rowUpdated : function(emp, event) {
        console.log('rowUpdated called');
        console.log(JSON.stringify(event.getParams()));
    },
    accountIdUpdated : function(cmp, event) {
        console.log('accountIdUpdated called');
        console.log(JSON.stringify(event.getParams()));
        cmp.set('v.accountId', event.getParams().value);
    }

})
