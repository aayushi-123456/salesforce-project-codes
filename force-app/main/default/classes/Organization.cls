public class Organization {
    public static void insertcompany(List<Company__c> complist){
        List<Department__c> dep = new list<Department__c>();
        for(Company__c comp : complist){
            for(Integer i =1;i<=5;i++){
                Department__c depart = new Department__c();
                depart.Name = 'depart-'+i;
                depart.Company__c = comp.id;
                dep.add(depart);
            }
            
           }
        insert dep;
        
        
    }

}