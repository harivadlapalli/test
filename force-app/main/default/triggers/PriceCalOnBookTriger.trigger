trigger PriceCalOnBookTriger on LBook__c (before insert, before update) {
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        PriceCalOnBook.calculateBooksPrice(trigger.new);
    }
}