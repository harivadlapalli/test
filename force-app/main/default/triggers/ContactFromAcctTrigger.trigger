trigger ContactFromAcctTrigger on Account (after insert, after update) {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        ContactFromAcctTrigHelper.createContacts(Trigger.new);
    }
}