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

    @IsTest static void builder() {

        Account a = (new AccountBuilder())
            .withName('xyz')
            .withDescription('new description')
            .build()
            .query();

        System.assertEquals('xyz', a.Name);
        System.assertEquals('new description', a.Description);


        Contact c = (new ContactBuilder())
            .withFirstName('John')
            .withLastName('Doe')
            .withAccountId(new AccountBuilder()
                .withName('Big Corp')
                .withDescription('Big Corp Description')
                .build().id)
            .build()
            .query();

        Account bigCorp = [select Name, Description from Account where Id = :c.AccountId];

        System.assertEquals('Big Corp', bigCorp.Name);
        System.assertEquals('Big Corp Description', bigCorp.Description);
}
    }

