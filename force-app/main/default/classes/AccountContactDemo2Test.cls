@isTest
public class AccountContactDemo2Test {
    
    @isTest
    static void accountconmethodTest(){
        List<Account> accList = new List<Account>();
      
        // Create an account with Annual Revenue less than 10000
        Account acc1 = new Account(Name = 'Anandh', AnnualRevenue = 5000);
        accList.add(acc1);

        // Create an account with Annual Revenue greater than or equal to 10000
        Account acc2 = new Account(Name = 'John', AnnualRevenue = 15000);
        accList.add(acc2);

        insert accList;
        
        Test.StartTest();
        AccountContactDemo2 accDemo = new AccountContactDemo2();
        accDemo.accountconmethod(accList);
        Test.StopTest();
        
        // Verify contacts and opportunities creation
        for(Account acct : accList){
            if(acct.AnnualRevenue < 10000){
                // Verify contact creation
                Integer expectedContacts = 1; // One contact should be created for each account
                List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId = :acct.Id];
                System.debug('Contact size='+contacts.size());
                System.assertEquals(expectedContacts, contacts.size(), 'Unexpected number of contacts created');
            } else {
                // Verify opportunity creation
                Integer expectedOpportunities = 1; // One opportunity should be created for each account
                List<Opportunity> opportunities = [SELECT Id FROM Opportunity WHERE AccountId = :acct.Id];
                System.assertEquals(expectedOpportunities, opportunities.size(), 'Unexpected number of opportunities created');
            }
        }
    }
}