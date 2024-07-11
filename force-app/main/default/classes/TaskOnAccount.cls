public class TaskOnAccount {
    public static void taskOnAmount(List<Account> accList){
        for(Account acc : accList){
            if(acc.AnnualRevenue <1000  || acc.AnnualRevenue > 50000){
                acc.addError('Please enter amount between 1000 and 50000 only.');
            }
            acc.Description = 'you entered amount between 1000 and 50000 only';
        }
    }
}