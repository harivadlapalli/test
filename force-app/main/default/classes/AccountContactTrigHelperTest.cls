@isTest
public class AccountContactTrigHelperTest {
    @testSetUp
    public static void testrecordscreation(){
        List<Contact> conRec=new List<Contact>();
        Contact con1=new Contact();
        con1.LastName='LastName1';
        con1.FirstName='FirstName1';
        con1.Email='test1@gmail.com';
        conRec.add(con1);
        
        Contact con2=new Contact();
        con2.LastName='LastName2';
        con2.FirstName='FirstName2';
        con2.Email='test2@gmail.com';
        conRec.add(con2);
        
        Insert conRec;
    }
    @isTest
    Public static void testMethod1(){
        List<Contact> conList=[select id,LastName,firstName,Email from Contact];
        system.debug('conList--->'+conList);
        AccountContactTrigHelper.findDuplicateContact(conList);
        AccountContactTrigHelper.sendSuccessEmail(conList[0]);
    }

}