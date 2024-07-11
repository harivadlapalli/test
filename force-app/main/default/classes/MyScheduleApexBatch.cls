public class MyScheduleApexBatch implements Schedulable {
    public void execute (SchedulableContext sc){
        AccountApexBatchHandler batchHandler = new AccountApexBatchHandler();
        Database.executeBatch(batchHandler,200);
    }
}