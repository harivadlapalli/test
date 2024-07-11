public class ContactTriggerHandler {
    public static void populateAccountNames(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        
        // Collect all AccountIds from the new Contact records
        for (Contact contact : newContacts) {
            if (contact.AccountId != null) {
                accountIds.add(contact.AccountId);
            }
        }
        
        // Query for the related Account records and create a map of Account Ids to Account Names
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :accountIds]);
        
        // Iterate over the new Contact records and populate the Account_Name__c field
        for (Contact cnct : newContacts) {
            if (cnct.AccountId != null && accountMap.containsKey(cnct.AccountId)) {
                // Set the Account Name on the Contact record
                cnct.LastName = accountMap.get(cnct.AccountId).Name;
            }
        }
    }
}