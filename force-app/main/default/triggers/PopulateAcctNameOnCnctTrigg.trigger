trigger PopulateAcctNameOnCnctTrigg on Contact (before insert) {
	ContactTriggerHandler.populateAccountNames(Trigger.new);
}