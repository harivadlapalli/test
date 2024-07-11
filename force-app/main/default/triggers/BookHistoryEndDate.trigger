trigger BookHistoryEndDate on Book_History__c (before insert,before update) {
   /* if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        BookHistoryEndDate.endDateAutoPapulate(Trigger.new);
    }*/
}