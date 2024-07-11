public class FutureMethodExample {

    public static void createAccount() {
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Achyuth Lega';
        accList.add(acc);
        System.debug('Syncronus future method');

        insert accList;

        // Pass the ID of the created Account to the future method
        if (accList.size() > 0) {
            createContactAsync(acc.Id);
        }
    }

    @Future
    public static void createContactAsync(Id accId) {
        // Retrieve the Account record using the provided Account Id
        Account acc = [SELECT Name FROM Account WHERE Id = :accId LIMIT 1];
        
        List<Contact> conList = new List<Contact>();
        Contact con = new Contact();
        con.AccountId = accId; // Use AccountId field to associate Contact with Account
        con.LastName = acc.Name; // Set the last name of contact as the name of the account
        conList.add(con);
        System.debug('Calling future method');
        insert conList;
    }
}