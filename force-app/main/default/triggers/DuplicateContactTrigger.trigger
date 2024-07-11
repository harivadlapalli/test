trigger DuplicateContactTrigger on Account (before delete) {
    if(trigger.isbefore && (trigger.isdelete)){
        DuplicateContactError.throwErrorOnContact(trigger.old);
    }
}