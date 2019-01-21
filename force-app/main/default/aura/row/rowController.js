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
    rowUpdated : function(cmp, event) {
        console.log('rowUpdated called');
        console.log(JSON.stringify(event.getParams()));
    },
    accountIdUpdated : function(cmp, event) {
        console.log('accountIdUpdated called text updated');
        
        const
            accountId = event.getParams().value[0],
            action = cmp.get('c.getAccount');
        
        console.log('accountId: ', accountId);

        cmp.set('v.accountId', accountId);
        action.setParams({accountId: accountId});

        action.setCallback(this, function(r) {

            if (r.getState()) {
                console.log(r.getReturnValue());
                cmp.set('v.accountFields', r.getReturnValue());
            } else {
                console.log(r.getError());
            }

        });
        $A.enqueueAction(action);

    },
    accountUpdated : function(cmp, event) {
        console.log('ACCOUNT UPDATED');
        console.log(JSON.stringify(event.getParams().value));
    },
    rowValueUpdated : function(cmp, event) {
        console.log('Row Value Updated:', event.getParams().value);
    }

})
