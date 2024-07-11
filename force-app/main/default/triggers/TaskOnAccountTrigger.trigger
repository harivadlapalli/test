trigger TaskOnAccountTrigger on Account (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert|| Trigger.isUpdate){
            TaskOnAccount.taskOnAmount(Trigger.New);
        }
    }
}