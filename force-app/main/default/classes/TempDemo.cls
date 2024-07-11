public class TempDemo {
    public void demoMethod(){
     
        // Query for Account records where the OwnerId matches the current user's Id
        List<Account> accList = [SELECT Id, Name FROM Account limit 2];
        Set<Id> accIds = new Set<Id>();
        for(Account acc: accList){
            accIds.add(acc.id);
        }
        System.debug('Acct Ids='+accIds);
    }
}