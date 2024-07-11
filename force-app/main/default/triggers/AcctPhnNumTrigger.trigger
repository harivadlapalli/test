trigger AcctPhnNumTrigger on Account (before insert,before update) {
    if (Trigger.isBefore &&(Trigger.isInsert || Trigger.isUpdate)) {
            AcctPhnNumTrigHelpr.phoneNumLenCheck(Trigger.new);
    }
}