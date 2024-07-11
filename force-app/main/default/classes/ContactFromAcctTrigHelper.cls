public class ContactFromAcctTrigHelper {
    public static void createContacts(List<Account> newAccounts) {
        List<Contact> newContacts = new List<Contact>();
        Set<String> existingLastNames = new Set<String>();
        
        for (Account acc : newAccounts) {
            // Check if account rating is 'Cool'
            if (acc.Rating == 'Cool') {
                // Create a new contact for each 'Cool' account
                Contact newContact = new Contact(
                    LastName = 'SampleLastName', // You may set the last name dynamically here
                    AccountId = acc.Id
                    // Set other contact fields as needed
                );
                newContacts.add(newContact);
            }
        }
        
        // Check for duplicate last names among existing contacts
        for (Contact existingContact : [SELECT LastName FROM Contact]) {
            existingLastNames.add(existingContact.LastName);
        }
        
        // Iterate over new contacts to check for duplicates and send emails
        for (Contact newContact : newContacts) {
            if (existingLastNames.contains(newContact.LastName)) {
                newContact.addError('A contact with the same last name already exists');
            } else {
                // Send email to the record owner or current user
                sendEmailToOwner(newContact);
            }
        }
        
        // Insert new contacts
        if (!newContacts.isEmpty()) {
            insert newContacts;
        }
    }
    
    private static void sendEmailToOwner(Contact contact) {
        // Get the owner ID of the contact's account
        Id ownerId = [SELECT OwnerId FROM Account WHERE Id = :contact.AccountId].OwnerId;
        // Get the owner's email address
        String ownerEmail = [SELECT Email FROM User WHERE Id = :ownerId].Email;
        
        // Create and send email
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{ownerEmail});
        email.setSubject('New Contact Created');
        email.setPlainTextBody('Hello,\n\nA new contact has been created for the account with ID: ' + contact.AccountId);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}