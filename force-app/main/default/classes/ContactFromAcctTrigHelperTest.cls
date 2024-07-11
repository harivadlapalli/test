@isTest
public class ContactFromAcctTrigHelperTest {
    @testSetUp
    public static void creatingTestRecords(){
        List<Account> accRec=new List<Account>();
        Account acc1=new Account();
        acc1.Name='testAccount1';
        acc1.Rating = 'Cool';
        accRec.add(acc1);
        
        Insert accRec;
        
        Contact con=new Contact();
        con.LastName='testCon';
        insert con;
    }
    @isTest
    public static void testmethd1(){
        List<Account> accList=[select id,Name,Rating from Account];
        ContactFromAcctTrigHelper.createContacts(accList);
    }

}