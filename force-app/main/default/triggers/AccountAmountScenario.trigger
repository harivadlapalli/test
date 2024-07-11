trigger AccountAmountScenario on Account (after insert,after update) {
    if((trigger.isafter && (trigger.isinsert || trigger.isupdate))){
          AmountAccountTask.createRelatedContAndOppo(trigger.new);
    }
}