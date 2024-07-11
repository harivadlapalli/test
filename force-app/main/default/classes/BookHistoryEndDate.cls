public class BookHistoryEndDate {
    public static void endDateAutoPopulate(List<Book_History__c> bookHistoriesList){
        for(Book_History__c bookhist : bookHistoriesList){
            if(bookhist.Issue_Date__c != null){
                // Use the addMonths() method to add 2 months to the Issue_Date__c
                Date endDate = bookhist.Issue_Date__c.addMonths(2);
                bookhist.Return_Date__c = endDate;
            }
        }        
    }
}

 /* Date startDate = bookhist.Issue_Date__c;
                   Integer year = startDate.year();
                Integer month = startDate.month();     
                month++;
                if (month > 12) {
                    month = 1;
                    year++;
                }
                Date endDate = Date.newInstance(year, month, startDate.day());
                bookhist.Return_Date__c = endDate;*/