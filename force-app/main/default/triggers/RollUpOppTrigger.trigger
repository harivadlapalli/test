trigger RollUpOppTrigger on Opportunity (after insert, after update, after delete) {
    if(trigger.isafter && (trigger.isinsert || trigger.isupdate || trigger.isdelete)) { 
        rolluponopp.methodname (trigger.new, trigger.oldMap);
        
    }
    
}