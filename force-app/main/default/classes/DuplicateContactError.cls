public class DuplicateContactError {
    public static void throwErrorOnContact(List<Account> oldAccList){
        Set<Id> accIds = new Set<Id>();
        if(oldAccList != null){
            for(Account acc : oldAccList){
                accIds.add(acc.id);
            }
        }
        List<Contact> contacts=[select id, name,AccountId from contact where AccountId IN:accIds];
        if(contacts.size()>2){
            for(Account acc : oldAccList){
                acc.addError('This parent having more than two childs');
            }
        }
    }
}