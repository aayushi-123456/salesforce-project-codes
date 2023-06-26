@isTest
public class contacttest {
    @isTest
    static void testcon(){
        Account acc = new Account();
        acc.Name = 'jerry atom';
        insert acc;
        
    }
    @isTest
    static void testcontact(){
        Account acc = new Account();
        acc.Name = 'jerry atom';
        acc.Contact_Name__c = 'aa,bb,cc';
        insert acc;
    }

}