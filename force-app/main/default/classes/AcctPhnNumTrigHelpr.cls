public class AcctPhnNumTrigHelpr {
    public static void phoneNumLenCheck(List<Account> acctList){
        for(Account acc : acctList){
            if(acc.Phone != null && acc.Phone.length() !=10){
                acc.addError('Phone Number must be 10 digits');
            }
            
        }
    }

}