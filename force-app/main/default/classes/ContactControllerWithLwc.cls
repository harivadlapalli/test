public class ContactControllerWithLwc {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecords(){
        List<Account> accList1 = [SELECT Id, Name FROM Account LIMIT 10];
        return accList1;
    }

}