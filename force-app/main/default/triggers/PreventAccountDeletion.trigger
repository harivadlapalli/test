trigger PreventAccountDeletion on Account (before delete) {
	 for (Account acc : Trigger.old) {
        if (acc.Active__c == 'yes') {
            acc.addError('You cannot delete an Account with Active "Yes".');
        }
    }
}