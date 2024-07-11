public class AmountAccountTask {
    public static void createRelatedContAndOppo(List<Account> accList){
        List<Contact> contactToBeInserted = new List<Contact>();
        List<Opportunity> oppToBeInserted = new List<Opportunity>();
        for(Account acc : accList){
            if(acc.AnnualRevenue < 10000){
                Contact cont = new Contact();     
                cont.LastName = acc.Name;
                cont.AccountId = acc.Id;
                contactToBeInserted.add(cont);
                
            }else if(acc.AnnualRevenue > 10000){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.AccountId = acc.Id;
                opp.StageName = 'Perception Analysis';
                opp.CloseDate = System.today();
                oppToBeInserted.add(opp);
                
            }
        }
        System.debug('Size = '+ contactToBeInserted.size() + 'Contact= '+ contactToBeInserted );
        if(!contactToBeInserted.isEmpty()) {
                insert contactToBeInserted;
            }
         
            if(!oppToBeInserted.isEmpty()) {
                insert oppToBeInserted;
            }
    }
}