public class PickListTriggerHelpper {
		public static void countryStatePL(List<Customer_Details__c> custDetailsList){
        Map<String, List<String>> countryStateMap = new Map<String, List<String>>();
        
        countryStateMap.put('INDIA', new List<String>{'Andhra Pradesh(Amaravati)'});
        countryStateMap.put('CHINA', new List<String>{'Sichuan', 'Bengbu','Beijing'});
        countryStateMap.put('PAKISTAN', new List<String>{'Karachi', 'Kalat','Kharan'});

        for(Customer_Details__c custDetails : custDetailsList){
            
            if(countryStateMap.containsKey(custDetails.Country__c) && countryStateMap.get(custDetails.Country__c) != null){
                custDetails.State__c = String.join(countryStateMap.get(custDetails.Country__c), ', ');
            }
        }
    }
}