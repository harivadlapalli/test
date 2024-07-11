public class AccountContactDemo2 {
    public void accountconmethod(List<Account> acclist){
        List<Contact> conlist = new List<Contact>();
        List<Opportunity> oplist = new List<Opportunity>();
        
        for (Account acc : acclist) {
            if (acc.AnnualRevenue < 10000) {
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.LastName = acc.Name;
                conlist.add(con);
                system.debug(conlist.size());
            }
            else if (acc.AnnualRevenue > 10000){
                Opportunity op = new Opportunity();
                op.AccountId = acc.Id;
                op.Name = acc.Name;
                op.StageName = 'Prospect';
                op.CloseDate = Date.today(); // Changed today() to Date.today()
                oplist.add(op);
            }
        }
        
        insert conlist;
        insert oplist;
    }
    
}