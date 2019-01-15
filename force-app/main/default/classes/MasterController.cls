public with sharing class MasterController {
    
    @AuraEnabled public static Detail__c[] get(Id masterId) {
        return [
            select Id, Name, Account__c, Account__r.Name, Value__c
            from Detail__c
            where Master__c = :masterId
        ];
    }
    
}
