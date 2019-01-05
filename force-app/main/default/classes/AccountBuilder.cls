public with sharing class AccountBuilder {
    
    Public Id id;
    String name = 'ABC';
    String accountNumber = '123';
    String site = 'https://www.abc.com';
    String description = 'boilerplace description';
    Integer numberOfEmployees = 100;

    public AccountBuilder() {
        
    }

    public AccountBuilder withName(String name) {
        this.name = name;
        return this;
    }

    public AccountBuilder withAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
        return this;
    }

    public AccountBuilder withSite(String site) {
        this.site = site;
        return this;
    }

    public AccountBuilder withDescription(String description) {
        this.description = description;
        return this;
    }

    public AccountBuilder withNumberOfEmployees(Integer numberOfEmployees) {
        this.numberOfEmployees = numberOfEmployees;
        return this;
    }

    public AccountBuilder Build() {
        Account a = new Account(
            Name = name,
            AccountNumber = accountNumber,
            Site = site,
            Description = description,
            NumberOfEmployees = numberOfEmployees 
        );
        insert a;

        id = a.Id;

        return this;
    }

    public Account query() {
        return [
            select 
                Id, 
                Name,
                AccountNumber,
                Site,
                Description,
                numberOfEmployees
            from Account
            where Id = :id
        ];
    }



}
