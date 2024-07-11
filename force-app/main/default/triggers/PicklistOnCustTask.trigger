trigger PicklistOnCustTask on Customer_Details__c (before insert, before update) {
		if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            PickListTriggerHelpper.countryStatePL(Trigger.new);
        }
    }
}