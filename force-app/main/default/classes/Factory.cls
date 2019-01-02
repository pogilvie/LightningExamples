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

    public static void setup() {

        Id masterId = createMaster('m');

        for (Integer i = 0; i < 10; i++) {
            createDetail(masterId, i);
        }

    }

    public static void cleanup() {
        delete [select Id from Detail__c];
        delete [select Id from Master__c];
    }

}
