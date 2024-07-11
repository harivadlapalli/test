public class AccountApexBatchHandler implements Database.Batchable<sObject>, Database.Stateful {
    // Define a class-level variable to hold processed record IDs
    private Set<Id> processedRecordIds = new Set<Id>();
    
    /*List<CronTrigger> jobIdList = [SELECT Id FROM CronTrigger WHERE CronJobDetail.Name IN ('Batch Scheduled')];
    for (CronTrigger jobId : jobIdList) {
        System.abortJob(jobId.Id);
    }*/
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Rating FROM Account]);
    }	
    
    public void execute(Database.BatchableContext context, List<Account> ListOfAccts) {
        for(Account acc : ListOfAccts) {
            if(acc.Rating == 'Warm' || acc.Rating == 'Cold' || acc.Rating == null || acc.Rating == 'cool' || acc.Rating == 'Hot') {
                acc.Rating = 'Nandhan';
                processedRecordIds.add(acc.Id);
            }
        }
        if(ListOfAccts.size()>0){
            update ListOfAccts;
        }
    }
    
    public void finish(Database.BatchableContext context) {
        System.debug('Updated Records:');
        // Query the updated records using the processedRecordIds variable
        for (Account acc : [SELECT Name, Rating FROM Account WHERE Id IN :processedRecordIds]) {
            System.debug('Account Name: ' + acc.Name + ', Rating: ' + acc.Rating);
        }
    }
}