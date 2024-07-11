public class createNewContactwithAccountQueueable implements Queueable{
    
    private List<Account> accListToCreateContact;
    
    public createNewContactwithAccountQueueable(List<Account> listAcct){
        this.accListToCreateContact = listAcct;
    }
    
    public void execute(QueueableContext contxt){
        List<Contact> conList = new List<Contact>();
        for(Account acc : accListToCreateContact){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            conList.add(con);
        }
        System.enqueueJob(new createNewOpportunitywithAccountQueueable(accListToCreateContact));
        if(conList.size() > 0){
            insert conList;
        }
    }
}