public class BookObjectExample {
    
    public void demoMethod(){
        List<Book__c> bookList = new List<Book__c>();
        String Name=' ';
        Integer c;
		c=[Select count() from Book__c where Name=: Name];
		System.debug('Books ='+c);
    }

}