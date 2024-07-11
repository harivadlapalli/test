public inherited sharing class InheritedSharing {
    
    public static integer getAccount(){
        return [select id, name from Account].size();
    }

}