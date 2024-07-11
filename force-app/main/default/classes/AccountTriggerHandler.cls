public class AccountTriggerHandler {
    
    /*public static void updateRating(List<Account> accList){
        for(Account acc : accList){
            if(acc.Industry != null && acc.Industry == 'Media'){
                acc.Rating='Hot';
            }else{
                acc.Rating='Cool';
            }
        }
    }*/
    
    public static void createRelatedCont(List<Account> accList){
        List<Contact> contactToBeInserted = new List<Contact>();
        for(Account acc : accList){
            if(acc.Rating == 'Hot'){
                Contact cont = new Contact();
                cont.LastName = 'Hari';
                cont.AccountId = acc.Id;
                contactToBeInserted.add(cont);
            }
            if(!contactToBeInserted.isEmpty()){
                insert contactToBeInserted;
            } 
        }
        
        
    }
    
}