@isTest
public class DuplicateContactErrorTest {

    @isTest
    static void testThrowErrorOnContact() {
       List<Account> acctList = new List<Account>();
        for(Integer i=0; i<3; i++){
            acctList.add(new Account(Name = 'Test Account'+i));
        }
        insert acctList;
        
        List<Contact> conList = new List<Contact>();
        for(Integer i =0; i< 3; i++){
            conList.add(new Contact(LastName = 'Test Account'+i,AccountId = acctList[0].id));
        }
        insert conList;
        
        Test.startTest();
        DuplicateContactError.throwErrorOnContact(acctList);	
        Test.stopTest();
        
        // Verify the error message is added to accounts with more than two children
        for (Account acc : acctList) {
            if (acc.Contacts.size() > 2) {
                System.assert(acc.HasErrors(), 'Error should be added to the account');
            } else {
                System.assertNotEquals(acc.HasErrors(), true, 'Error should not be added to the account');
            }
        }
    }
}