public with sharing class Factory {
    
    public static Id createMaster(Decimal value) {

        Master__c m = new Master__c(
            Master_Value__c = value
        );
        insert m;

        return m.Id;
    }

    public static Id createDetail(Id masterId, Id accountId, Integer value) {

        Detail__c d = new Detail__c(
            Master__c = masterId,
            Account__c = accountId,
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

        Id masterId = createMaster(10);

        createDetail(masterId, createAccount('apple'), 10);
        createDetail(masterId, createAccount('pear'), 20);

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
