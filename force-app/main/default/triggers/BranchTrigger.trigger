trigger BranchTrigger on Branch__c (before insert, before update, after insert, after update) {
    
    if(Trigger.isbefore && Trigger.isInsert){
        System.Debug('Insert Related');
        System.debug('--Trigger.new--'+Trigger.new);
        System.debug('--Trigger.old--'+Trigger.old);
    }
    
    if(Trigger.isafter && Trigger.isInsert){
        System.Debug('Insert Related');
        System.debug('--Trigger.new--'+Trigger.new);
        System.debug('--Trigger.old--'+Trigger.old);
    }
    
    if(Trigger.isbefore && Trigger.isUpdate){
        System.Debug('Update Related');
        System.debug('--Trigger.new--'+Trigger.new);
        System.debug('--Trigger.old--'+Trigger.old);
    }
    
    if(Trigger.isafter && Trigger.isUpdate){
        System.Debug('Update Related');
        System.debug('--Trigger.new--'+Trigger.new);
        System.debug('--Trigger.old--'+Trigger.old);
    }

}