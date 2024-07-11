trigger AccountTrigger on Account (after insert,after update) {
     /*if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        AccountTriggerHandler.updateRating(trigger.new);
     }else if((trigger.isafter && (trigger.isinsert || trigger.isupdate))){
          AccountTriggerHandler.createRelatedOpp(trigger.new);
     }*/
    if((trigger.isafter && (trigger.isinsert || trigger.isupdate))){
          AccountTriggerHandler.createRelatedCont(trigger.new);
    }
}