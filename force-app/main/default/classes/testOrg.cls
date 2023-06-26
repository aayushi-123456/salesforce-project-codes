@isTest
public class testOrg {
    @isTest
    private static void setup(){
        Company__c comp = new Company__c();
        comp.Name ='test';
        insert comp;
    }
    
        
}