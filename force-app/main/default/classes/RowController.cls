public with sharing class RowController {
    
    @AuraEnabled public static Account getAccount(String accountId) {

        try {
            return [
                select Id, Name, Account_Value__c
                from Account
                where Id = :accountId
            ];
        } catch(Exception e) {
            throw new AuraException(e.getMessage());
        }

    }

}
