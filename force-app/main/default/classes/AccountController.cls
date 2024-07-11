public class AccountController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [select id, Name from Account Limit 10];
    }

}