@IsTest public with sharing class Requirements {
    
    @TestSetup static void setup() {
        Factory.setup();
    }

    @IsTest static void verifyMasterRollups() {

        Master__c m = [
            select Id, Count__c, Sum__c
            from Master__c
        ];

        System.assertEquals(m.Count__c, 10);
        System.assertEquals(m.Sum__c, 45);

    }

}
