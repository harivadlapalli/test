public with sharing class LockerReservationController {
    
    @AuraEnabled(cacheable=true)
    public static String reserveLocker(String lockerNumber, String userName) {
        // Implement reservation logic here
        return 'Locker ' + lockerNumber + ' reserved for ' + userName;
    }
}