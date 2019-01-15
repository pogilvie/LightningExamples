({
    masterUpdated : function(cmp, event, helper) {

        helper.getRecords(cmp);

    },
    handleLoad : function(cmp, event) {
        console.log('handleLoad');
    },
    handleSubmit : function(cmp, event) {
        console.log('handleSubmit');

        event.preventDefault();       // stop the form from submitting

        let 
            fields = event.getParam('fields');
        
        fields.Master__c = cmp.get('v.recordId');
        
        cmp.find('rowForm').submit(fields);

    },
    handleSuccess: function(cmp, event) {
        console.log('handleSuccess');
    }
})
