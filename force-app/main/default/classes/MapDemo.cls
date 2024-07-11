public class MapDemo {
    
    public void mapDemoMethod(){
        
         Id currentUserId = UserInfo.getUserId();
         System.debug('OwnerId: ' + currentUserId);
        
   		List<Account> accist= [select Id,Name from Account limit 16];
        Map<Id,Account> IdToAcctMap = new Map<Id,Account>(accist);
        System.debug('Map1='+accist);
    }

}