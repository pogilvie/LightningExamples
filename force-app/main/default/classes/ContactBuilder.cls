public with sharing class ContactBuilder {

    Public Id id;
    String name;
    String firstName;
    String lastName;
    Id AccountId;

    public ContactBuilder withFirstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    public ContactBuilder withLastName(String lastName) {
        this.lastName = lastName;
        return this;
    }

    public ContactBuilder withAccountId(Id accountId) {
        this.accountId = accountId;
        return this;
    }

    public ContactBuilder build() {
        Contact c = new Contact(
            FirstName = firstName,
            LastName = lastName,
            AccountId = accountId
        );
        insert c;
        name = c.Name;
        id = c.Id;
        return this;
    }

    public Contact query() {
        return [
            select
                Id,
                Name,
                FirstName,
                LastName,
                AccountId
            from Contact
            where Id = :id
        ];
    }
}
