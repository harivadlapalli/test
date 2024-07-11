public class GetAccountRecords {
    @AuraEnabled
    public static List<Account> getAccRec(){
        List<Account> accrec = [Select id, Name, Phone from Account limit 20];
        return accrec;
    }
}