trigger AccountForCreatingContactQueuaeble on Account (after insert) {
    if(trigger.isafter && (trigger.isinsert || trigger.isupdate)){
        System.enqueueJob(new createNewContactwithAccountQueueable(trigger.new));
    }
}