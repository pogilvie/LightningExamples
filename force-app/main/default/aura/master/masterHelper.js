({
    getRecords : function(cmp) {
        const
            action = cmp.get('c.get');
    
        action.setParams({ masterId: cmp.get('v.recordId')});

        action.setCallback(this, function(r) {

        if (r.getState() === 'SUCCESS') {
            const
                rows = [],
                records = r.getReturnValue();

            console.log('Detail Records', records);

            records.forEach(function(d) {

                let o = {
                             Id : d.Id,
                           Name : d.Name,
                      AccountId : d.Account__c,
                    AccountName : d.Account__r.Name,
                          Value : d.Value__c
                }

                rows.push(o);

            });

            cmp.set('v.rows', rows);

            console.log('getRecords Completed');

        } else {
            console.log('getRecords failed ', r.getError());
        }

    });

    $A.enqueueAction(action);
    }
})
