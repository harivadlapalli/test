public class createNewOpportunitywithAccountQueueable implements Queueable{
	private List<Account> accListToCreateContact;
    
    public createNewOpportunitywithAccountQueueable(List<Account> listAcct){
        this.accListToCreateContact = listAcct;
    }
    
    public void execute(QueueableContext contxt){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accListToCreateContact){
            Opportunity oppo = new Opportunity();
            oppo.AccountId = acc.Id;
            oppo.Name = acc.Name;
            oppo.StageName = 'Closed Won';
            oppo.CloseDate = System.today()+3;
            oppo.Description = 'Hello Hari your queues working properly';
            oppList.add(oppo);
        }
        if(oppList.size() > 0){
            insert oppList;
        }
    }
}