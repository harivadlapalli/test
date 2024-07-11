public class DeleteRecordsFromCustomerDetailsObj {
    
    public static void deleteRecords(){    
    List<Customer_Details__c> custDetails = [select id from Customer_Details__c];
    delete custDetails;

    }

}