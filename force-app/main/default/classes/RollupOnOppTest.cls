@isTest
public class RollupOnOppTest {
    @testSetUp
    Public static void creattestData(){
        Account acc1=new Account();
        acc1.Name='testAccount1';
        acc1.Rating = 'Cool';
        Insert acc1;
        
        List<Opportunity> oppRec=new List<Opportunity>();
        Opportunity opp=new Opportunity();
        opp.AccountId=acc1.Id;
        opp.Name='testOpp';
        opp.StageName='Proposal/Price Quote';
        opp.CloseDate=system.today();
        opp.Amount=1000;
        oppRec.add(opp);
        insert oppRec;
        
        opp.Amount=2000;
        update opp;
        
        
       delete opp;
    }
    @isTest
    Public static void method1(){
        List<Opportunity> oppList=[select id,Name,StageName,CloseDate,AccountId,Amount from Opportunity];
        RollupOnOpp.methodName(oppList,Null);
    }

}