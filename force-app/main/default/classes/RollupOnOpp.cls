public class RollupOnOpp {
    public static void methodName(List<Opportunity> newList, Map<Id, Opportunity> oldMap) {
        Set<Id> accIds = new Set<Id>();
        
        // For insertion
        if (newList != null && oldMap == null) {
            for (Opportunity opp : newList) {
                accIds.add(opp.AccountId);	
            }
        }
        // For update
        else if (oldMap != null && newList != null) {
            for (Opportunity opp : newList) {
                if (oldMap.containsKey(opp.Id) && opp.Amount != oldMap.get(opp.Id).Amount) {
                    accIds.add(opp.AccountId);
                    accIds.add(oldMap.get(opp.Id).AccountId);
                }
            }
        }
        // For deletion
        else if (newList == null) {
            for (Opportunity opp : oldMap.values()) {
                if (opp.AccountId != null) {
                    accIds.add(opp.AccountId);
                }
            }
        }
        
        if (!accIds.isEmpty()) {
            List<Account> accountsToUpdate = new List<Account>(); // Create a list to hold updated Account records
            
            List<AggregateResult> aggregatedResults = [SELECT AccountId, SUM(Amount) totalAmount, Count(Id) totalCount FROM Opportunity WHERE AccountId IN :accIds GROUP BY AccountId];
            
            for (AggregateResult ar : aggregatedResults) {
                Id accountId = (Id) ar.get('AccountId');
                Decimal totalAmount = (Decimal) ar.get('totalAmount');
                Decimal totalCount = (Decimal) ar.get('totalCount');
                
                // Create a new Account record with updated fields
                Account accToUpdate = new Account(Id = accountId);
                accToUpdate.Total_Opportunity_Amount__c = totalAmount;
                accToUpdate.Child_Count__c = totalCount;
                
                accountsToUpdate.add(accToUpdate); // Add the updated Account record to the list
            }
            
            // Perform a single update operation for all the updated Account records
            update accountsToUpdate;
        }
        
    }
}