public class TestDBSaveResult {
    
    public static void testDBSaveResults (){
        List<Contact> conList = new List<Contact> {
            new Contact(FirstName = 'Hari', LastName = 'Haran'),
            new Contact(FirstName = 'Acchu', LastName = 'Lega'),
            new Contact()};
       Database.SaveResult[] result = Database.insert(conList,false);
        
        if(result.size() > 0){
            for(DataBase.SaveResult sr : result){
                if(sr.isSuccess()){
                    System.debug('Record inserted Successfully: '+sr.getId());
                }else {
                    for(DataBase.Error err : sr.getErrors()){
                        System.debug('Error Occured While inserting this record');
                        System.debug(err.getStatusCode() + ' : ' + err.getMessage());
                        System.debug('Fields Effected while inserting: '+err.getFields());
                    }
                }
            }
        }
    }
}