public class ImperativeMethodForContacts {

    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContactInfo(){
        return [select Id,Name, Title,Email from Contact LIMIT 10];
    }
}