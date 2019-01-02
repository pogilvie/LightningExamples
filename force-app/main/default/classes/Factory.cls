public with sharing class Factory {
    
    public static Id createMaster(String name) {

        Master__c m = new Master__c(
            Name = name
        );
        insert m;

        return m.Id;
    }

    public static Id createDetail(Id masterId, Integer value) {

        Detail__c d = new Detail__c(
            Master__c = masterId,
            Value__c = value
        );
        insert d;

        return d.Id;
    }

    public static Id createAccount(String name) {
  
        Account a = new Account(
            Name = name
        );
        insert a;

        return a.Id;
    }

    public static Id createContact(String firstName, String lastName) {
        Contact c = new Contact(
            FirstName = firstName,
            LastName = lastName
        );
        insert c;

        return c.Id;
    }

    public static void setup() {

        Id masterId = createMaster('m');

        for (Integer i = 0; i < 10; i++) {
            createDetail(masterId, i);
        }

        /* create three Accounts and an unlinked Contact
        */
        createAccount('apple');
        createAccount('pear');
        createAccount('orange');

        createContact('John', 'Doe');

    }

    public static void cleanup() {
        delete [select Id from Detail__c];
        delete [select Id from Master__c];
        delete [select Id from Contact];
        delete [select Id from Account];
    }

}
