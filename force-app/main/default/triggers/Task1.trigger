trigger Task1 on Account (before insert, before update) {
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        Demo.AccountTypeMethod(trigger.new);
    }
}