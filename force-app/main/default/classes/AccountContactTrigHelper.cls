public class AccountContactTrigHelper {
    
    public static void findDuplicateContact(List<Contact> newList){
        system.debug('newList--->'+newList);
        List<Contact> oldContList = [select id, LastName from contact];
        system.debug('oldContList--->'+oldContList);
        set<String> existingLastNames =new set<String>();
        for(Contact con : oldContList){
            existingLastNames.add(con.LastName);
        }
        system.debug('existingLastNames--->'+existingLastNames);
        for (Contact newContact : newList) {
            if (existingLastNames.contains(newContact.LastName)) {
                newContact.addError('Contact with the same last name already exists');
            } else {
                // Send an email if the contact is successfully created
                sendSuccessEmail(newContact);
            }
        }
        
    }
    @testVisible
    private static void sendSuccessEmail(Contact contact) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] { contact.Email }; // Change this to the appropriate field on Contact
        email.setToAddresses(toAddresses);
        email.setSubject('Record Created Successfully');
        email.setPlainTextBody('Hello ' + contact.FirstName + contact.LastName + ',\n\n' +
                              'Your record has been created successfully.\n\n' +
                              'Have a nice day!');
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        // Check for errors and handle them if needed
    }
    
}