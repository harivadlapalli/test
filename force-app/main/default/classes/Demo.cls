public class Demo {
    public static void AccountTypeMethod(List<Account> accountList){
    for(Account acc : accountList){
        if (acc.Rating=='Hot'){
            acc.Description='this account Rating is Hot';
        }
        if(acc.Rating=='Cold'){
            acc.Description='this account Rating is Cold';	
        }
        if(acc.Rating=='Warm'){
            acc.Description='this account Rating is Warm';
        }
    }
   }
}