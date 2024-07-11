trigger ContactAccountTrigger on Contact (before insert,before update) {
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        AccountContactTrigHelper.findDuplicateContact(trigger.new);
    }
}